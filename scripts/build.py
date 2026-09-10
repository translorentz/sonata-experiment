#!/usr/bin/env python3
"""Compile, synthesize, and make a frame-exact score video from LilyPond.

Usage: python scripts/build.py --soundfont /path/to/piano.sf2
All event times are rational numbers, integrated from the compiled MIDI's
tempo map. No audio is trimmed, stretched, cross-faded, or manually aligned.
"""
from __future__ import annotations

import argparse
import ctypes as C
from ctypes.util import find_library
from collections import defaultdict
from fractions import Fraction
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import wave

import mido
import numpy as np
from PIL import Image
from pypdf import PdfReader

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'output'
WORK = ROOT / '.build'
RATE = 48000
FPS = 25
WIDTH, HEIGHT = 1080, 1528
TAIL = Fraction(3)


def run(args, **kwargs):
    return subprocess.run([str(a) for a in args], check=True, **kwargs)


def digest(path):
    h = hashlib.sha256()
    with open(path, 'rb') as f:
        for block in iter(lambda: f.read(1 << 20), b''):
            h.update(block)
    return h.hexdigest()


def exact_integer(value, description):
    if value.denominator != 1:
        raise ValueError(f'{description} is not on the selected clock: {value}')
    return int(value)


def timeline(mid):
    """Return MIDI events with absolute ticks and rational seconds."""
    ticks = 0
    seconds = Fraction(0)
    tempo = 500000
    events = []
    tempo_map = [(0, Fraction(0), tempo)]
    for msg in mido.merge_tracks(mid.tracks):
        seconds += Fraction(msg.time * tempo, mid.ticks_per_beat * 1_000_000)
        ticks += msg.time
        events.append((ticks, seconds, msg))
        if msg.type == 'set_tempo':
            tempo = msg.tempo
            tempo_map.append((ticks, seconds, tempo))

    def seconds_at(tick):
        start_tick, start_second, us = tempo_map[0]
        for entry in tempo_map[1:]:
            if entry[0] > tick:
                break
            start_tick, start_second, us = entry
        return start_second + Fraction((tick - start_tick) * us,
                                       mid.ticks_per_beat * 1_000_000)
    return events, seconds_at


class Piano:
    """Small explicit FluidSynth binding; supports a system or local library."""
    def __init__(self, soundfont, library=None):
        library = library or find_library('fluidsynth')
        if not library:
            raise RuntimeError('Install libfluidsynth, or pass --fluid-library.')
        self.lib = C.CDLL(str(library))
        self.functions = {}
        signatures = {
            'new_fluid_settings': (C.c_void_p, []),
            'delete_fluid_settings': (None, [C.c_void_p]),
            'fluid_settings_setnum': (C.c_int, [C.c_void_p,C.c_char_p,C.c_double]),
            'fluid_settings_setint': (C.c_int, [C.c_void_p,C.c_char_p,C.c_int]),
            'new_fluid_synth': (C.c_void_p,[C.c_void_p]),
            'delete_fluid_synth': (None,[C.c_void_p]),
            'fluid_synth_sfload': (C.c_int,[C.c_void_p,C.c_char_p,C.c_int]),
            'fluid_synth_program_change': (C.c_int,[C.c_void_p,C.c_int,C.c_int]),
            'fluid_synth_noteon': (C.c_int,[C.c_void_p,C.c_int,C.c_int,C.c_int]),
            'fluid_synth_noteoff': (C.c_int,[C.c_void_p,C.c_int,C.c_int]),
            'fluid_synth_cc': (C.c_int,[C.c_void_p,C.c_int,C.c_int,C.c_int]),
            'fluid_synth_pitch_bend': (C.c_int,[C.c_void_p,C.c_int,C.c_int]),
            'fluid_synth_write_s16': (C.c_int,[C.c_void_p,C.c_int,C.c_void_p,C.c_int,C.c_int,C.c_void_p,C.c_int,C.c_int]),
        }
        for name,(restype,argtypes) in signatures.items():
            fn = getattr(self.lib,name)
            fn.restype, fn.argtypes = restype, argtypes
            self.functions[name] = fn
        self.settings = self.call('new_fluid_settings')
        if not self.settings:
            raise RuntimeError('Cannot allocate FluidSynth settings.')
        for key,value in [('synth.sample-rate',RATE),('synth.gain',0.45),
                          ('synth.reverb.room-size',0.4),('synth.reverb.damp',0.35),
                          ('synth.reverb.width',60),('synth.reverb.level',0.18)]:
            if self.call('fluid_settings_setnum',self.settings,key.encode(),value) != 0:
                raise RuntimeError(f'Cannot set {key}')
        for key,value in [('synth.chorus.active',0),('synth.polyphony',256),
                          ('synth.cpu-cores',1),('synth.threadsafe-api',0)]:
            if self.call('fluid_settings_setint',self.settings,key.encode(),value) != 0:
                raise RuntimeError(f'Cannot set {key}')
        self.synth = self.call('new_fluid_synth',self.settings)
        if not self.synth:
            raise RuntimeError('Cannot allocate FluidSynth.')
        if self.call('fluid_synth_sfload',self.synth,os.fsencode(soundfont),1) < 0:
            raise RuntimeError(f'Cannot load {soundfont}')

    def call(self,name,*args):
        return self.functions[name](*args)

    def message(self,msg):
        operation = None
        if msg.type == 'note_on':
            operation = ('noteon',[msg.channel,msg.note,msg.velocity]) if msg.velocity else ('noteoff',[msg.channel,msg.note])
        elif msg.type == 'note_off':
            operation = ('noteoff',[msg.channel,msg.note])
        elif msg.type == 'control_change':
            operation = ('cc',[msg.channel,msg.control,msg.value])
        elif msg.type == 'program_change':
            operation = ('program_change',[msg.channel,msg.program])
        elif msg.type == 'pitchwheel':
            operation = ('pitch_bend',[msg.channel,msg.pitch+8192])
        if operation:
            name,args = operation
            if self.call('fluid_synth_'+name,self.synth,*args) != 0:
                raise RuntimeError(f'FluidSynth rejected {msg}')

    def samples(self,count):
        data = np.empty((count,2),dtype='<i2')
        pointer = data.ctypes.data_as(C.c_void_p)
        if self.call('fluid_synth_write_s16',self.synth,count,pointer,0,2,pointer,1,2) != 0:
            raise RuntimeError('FluidSynth rendering failed.')
        return data

    def close(self):
        self.call('delete_fluid_synth',self.synth)
        self.call('delete_fluid_settings',self.settings)


def synthesize(events, duration, args):
    piano = Piano(args.soundfont,args.fluid_library)
    position = 0
    peak = 0
    target = WORK/'render.wav'
    try:
        with wave.open(str(target),'wb') as wav:
            wav.setparams((2,2,RATE,0,'NONE','not compressed'))
            def write_until(end):
                nonlocal position, peak
                while position < end:
                    size = min(16384,end-position)
                    samples = piano.samples(size)
                    peak = max(peak,int(np.max(np.abs(samples.astype(np.int32)))))
                    wav.writeframes(samples.tobytes())
                    position += size
            for _,time,msg in events:
                sample = exact_integer(time*RATE,'MIDI event sample')
                write_until(sample)
                if not msg.is_meta:
                    piano.message(msg)
            write_until(exact_integer(duration*RATE,'Audio duration'))
    finally:
        piano.close()
    if not 0 < peak < 32767:
        raise ValueError(f'Silent or clipped synthesizer output: peak {peak}')
    gain = 10**(-1.2/20)*32767/peak
    run(['ffmpeg','-hide_banner','-loglevel','error','-y','-i',target,
         '-af',f'volume={gain:.12f}','-c:a','flac','-sample_fmt','s16','-compression_level','8',
         OUT/'second-spring.flac'])
    return {'sample_rate':RATE,'samples':position,'raw_peak':peak,
            'gain':gain,'soundfont':Path(args.soundfont).name,
            'soundfont_sha256':digest(args.soundfont)}


def pages_and_video(page_map, duration, pdftoppm):
    # Render to an empty staging directory, so a shorter revised edition
    # cannot inherit stale pages from a previous output.
    with tempfile.TemporaryDirectory(prefix='pages-',dir=WORK) as folder:
        staging = Path(folder)
        run([pdftoppm,'-png','-scale-to-x',WIDTH,'-scale-to-y',HEIGHT,
             OUT/'second-spring.pdf',staging/'page'])
        rendered = sorted(staging.glob('page-*.png'))
        if len(rendered) != len(page_map):
            raise ValueError(f'Rendered {len(rendered)} pages; expected {len(page_map)}.')
        for old_page in list((OUT/'pages').glob('page-*.png')):
            old_page.unlink()
        for page in rendered:
            shutil.copyfile(page,OUT/'pages'/page.name)
    page_files = sorted((OUT/'pages').glob('page-*.png'))
    if len(page_files) != len(page_map):
        raise ValueError('Rendered pages differ from score manifest.')
    # Make the video canvas explicit and even-sized for H.264 4:2:0.
    for path in page_files:
        with Image.open(path) as im:
            if im.size != (WIDTH,HEIGHT):
                raise ValueError(f'Unexpected page size: {path}: {im.size}')
    command = ['ffmpeg','-hide_banner','-loglevel','error','-y',
        '-f','rawvideo','-pix_fmt','rgb24','-s:v',f'{WIDTH}x{HEIGHT}',
        '-r',str(FPS),'-i','pipe:0','-i',str(OUT/'second-spring.flac'),
        '-map','0:v:0','-map','1:a:0','-c:v','libx264','-preset','veryfast',
        '-crf','19','-tune','stillimage','-pix_fmt','yuv420p',
        '-g',str(FPS*10),'-video_track_timescale','48000',
        '-c:a','aac','-b:a','192k','-ar',str(RATE),
        '-movflags','+faststart','-t',str(float(duration)),
        str(OUT/'second-spring.mp4')]
    with subprocess.Popen(command,stdin=subprocess.PIPE) as process:
        try:
            for entry,path in zip(page_map,page_files):
                with Image.open(path) as im:
                    frame = im.convert('RGB').tobytes()
                frames = entry['end_frame']-entry['start_frame']
                print(f'Video page {entry["page"]:02d}: frames {entry["start_frame"]}–{entry["end_frame"]-1}',flush=True)
                for _ in range(frames):
                    process.stdin.write(frame)
        finally:
            process.stdin.close()
        if process.wait() != 0:
            raise RuntimeError('Video encoding failed.')


def verify(events, mid, structure, page_map, duration):
    expected_ticks = structure['bars']*structure['beats_per_bar']*mid.ticks_per_beat
    assert events[-1][0] == expected_ticks, 'Score is not exactly 200 complete bars.'
    notes = [(tick,time,msg) for tick,time,msg in events if msg.type == 'note_on' and msg.velocity > 0]
    assert notes, 'MIDI contains no notes.'
    assert min(m.note for _,_,m in notes) >= 21 and max(m.note for _,_,m in notes) <= 108
    # A pitched reference check, independent of the generator's text format.
    rh_notes = []
    for track in mid.tracks:
        if track.name.startswith('upper'):
            rh_notes = [m.note for m in track if m.type=='note_on' and m.velocity>0]
    assert rh_notes[:5] == [76,74,76,72,71], f'Incorrect source sigh: {rh_notes[:5]}'
    cadence_register = {}
    largest_chord = 0
    for track in mid.tracks:
        if not track.name.startswith(('upper','lower')):
            continue
        tick = 0
        onsets = defaultdict(list)
        for msg in track:
            tick += msg.time
            if msg.type=='note_on' and msg.velocity>0:
                onsets[tick].append(msg.note)
        largest_chord = max(largest_chord,max(max(p)-min(p) for p in onsets.values()))
        if track.name.startswith('upper'):
            for bar in [41,48,64,161,168,184,200]:
                cadence_register[bar] = max(onsets[(bar-1)*4*mid.ticks_per_beat])
    assert largest_chord <= 12, 'A simultaneous hand position exceeds an octave.'
    assert cadence_register == {41:78,48:78,64:86,161:71,168:71,184:79,200:79}, 'S theme/cadence register changed.'
    assert len(PdfReader(OUT/'second-spring.pdf').pages) == len(page_map)
    for page in page_map:
        tick = (page['first_bar']-1)*4*mid.ticks_per_beat
        assert any(t==tick for t,_,_ in notes), f'No onset at page {page["page"]} boundary.'
        assert page['start_frame']*RATE == page['start_sample']*FPS
    probe = json.loads(subprocess.check_output(['ffprobe','-v','error',
        '-count_frames','-show_streams','-show_format','-of','json',str(OUT/'second-spring.mp4')]))
    video = next(s for s in probe['streams'] if s['codec_type']=='video')
    audio = next(s for s in probe['streams'] if s['codec_type']=='audio')
    assert int(video['nb_read_frames']) == exact_integer(duration*FPS,'Frame count')
    assert video['start_time'] == '0.000000' and audio['start_time'] == '0.000000'
    assert abs(float(audio['duration'])-float(duration)) <= 1/RATE
    # Decode the two frames at EVERY page turn, not just container timestamps.
    boundary_frames = sorted({f for p in page_map[1:] for f in [p['start_frame']-1,p['start_frame']]})
    selections = '+'.join(f'eq(n\\,{f})' for f in boundary_frames)
    checks = WORK/'video-checks'
    checks.mkdir(exist_ok=True)
    for old_frame in list(checks.glob('frame-*.png')):
        old_frame.unlink()
    run(['ffmpeg','-hide_banner','-loglevel','error','-y','-i',OUT/'second-spring.mp4',
         '-vf',f'select={selections}','-fps_mode','vfr',checks/'frame-%03d.png'])
    page_arrays = []
    for path in sorted((OUT/'pages').glob('page-*.png')):
        with Image.open(path) as im:
            page_arrays.append(np.asarray(im.convert('L').resize((270,382)),dtype=np.float32))
    max_error = 0.0
    for frame,path in zip(boundary_frames,sorted(checks.glob('frame-*.png')),strict=True):
        expected = max(i for i,p in enumerate(page_map) if p['start_frame']<=frame)
        with Image.open(path) as im:
            decoded = np.asarray(im.convert('L').resize((270,382)),dtype=np.float32)
        errors = [float(np.mean(np.abs(decoded-p))) for p in page_arrays]
        assert int(np.argmin(errors)) == expected, f'Wrong page at video frame {frame}'
        assert errors[expected] < 3.0, f'Excessive video degradation at {frame}'
        max_error = max(max_error,errors[expected])
    return {'bars':structure['bars'],'quarter_notes':800,'note_on_events':len(notes),
            'piano_range_midi':[min(m.note for _,_,m in notes),max(m.note for _,_,m in notes)],
            'source_sigh_midi':rh_notes[:5],'pages':len(page_map),
            'largest_simultaneous_hand_span_semitones':largest_chord,
            'secondary_theme_and_cadence_soprano_midi':cadence_register,
            'video_frames':int(video['nb_read_frames']),'duration_seconds':float(duration),
            'page_turns_verified':len(page_map)-1,'decoded_boundary_frames_checked':len(boundary_frames),
            'max_boundary_frame_mean_pixel_error':max_error,
            'page_boundary_frame_error':0,'page_boundary_sample_error':0,
            'audio_codec':audio['codec_name'],'video_codec':video['codec_name'],
            'audio_start_seconds':float(audio['start_time']),'video_start_seconds':float(video['start_time'])}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--lilypond',default='lilypond')
    parser.add_argument('--soundfont',required=True,type=Path)
    parser.add_argument('--fluid-library',type=Path)
    parser.add_argument('--pdftoppm',default='pdftoppm')
    args = parser.parse_args()
    args.soundfont = args.soundfont.resolve()
    if not args.soundfont.is_file():
        parser.error('SoundFont does not exist.')
    for tool in ['ffmpeg','ffprobe','pdftoppm']:
        if not shutil.which(tool):
            parser.error(f'Missing program: {tool}')
    WORK.mkdir(exist_ok=True)
    (WORK/'tmp').mkdir(exist_ok=True)
    (WORK/'cache').mkdir(exist_ok=True)
    OUT.mkdir(exist_ok=True)
    (OUT/'pages').mkdir(exist_ok=True)
    env = dict(os.environ,TMPDIR=str(WORK/'tmp'),XDG_CACHE_HOME=str(WORK/'cache'))
    with open(WORK/'lilypond.log','w') as log:
        run([args.lilypond,'-dno-point-and-click','-o',OUT/'second-spring',
             ROOT/'score/second-spring.ly'],env=env,stdout=log,stderr=subprocess.STDOUT)
    log = (WORK/'lilypond.log').read_text()
    # A Guile GC host stack-introspection notice is not an engraving warning.
    engraving_log = '\n'.join(line for line in log.splitlines() if not line.startswith('GC Warning:'))
    if re.search(r'(?:warning:|error:|barcheck failed)',engraving_log,re.I):
        raise RuntimeError('Engraving warnings require review: .build/lilypond.log')
    structure = json.loads((ROOT/'score/structure.json').read_text())
    mid = mido.MidiFile(OUT/'second-spring.mid')
    events, seconds_at = timeline(mid)
    end_tick = structure['bars']*4*mid.ticks_per_beat
    musical_end = seconds_at(end_tick)
    duration = musical_end + TAIL
    page_map = []
    for i,page in enumerate(structure['pages']):
        start = seconds_at((page['first_bar']-1)*4*mid.ticks_per_beat)
        end = seconds_at(page['last_bar']*4*mid.ticks_per_beat)
        if i == len(structure['pages'])-1:
            end = duration
        page_map.append(dict(page,start_seconds=float(start),end_seconds=float(end),
            start_frame=exact_integer(start*FPS,'Page frame'),
            end_frame=exact_integer(end*FPS,'Page end frame'),
            start_sample=exact_integer(start*RATE,'Page sample'),
            end_sample=exact_integer(end*RATE,'Page end sample')))
    timing = {'fps':FPS,'sample_rate':RATE,'musical_end_seconds':float(musical_end),
              'release_tail_seconds':float(TAIL),'pages':page_map}
    (OUT/'page-timing.json').write_text(json.dumps(timing,indent=2)+'\n')
    print(f'Compiled: {structure["bars"]} bars, music {float(musical_end):.3f}s.',flush=True)
    audio_report = synthesize(events,duration,args)
    print('Piano rendered; encoding score video.',flush=True)
    pages_and_video(page_map,duration,args.pdftoppm)
    report = verify(events,mid,structure,page_map,duration)
    report['audio_render'] = audio_report
    report['lilypond_version'] = subprocess.check_output([args.lilypond,'--version'],text=True).splitlines()[0]
    report['artifacts'] = {str(p.relative_to(ROOT)):digest(p) for p in
        sorted(OUT.rglob('*')) if p.is_file() and p.name!='validation.json'}
    (OUT/'validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k not in ['audio_render','artifacts']},indent=2))


if __name__ == '__main__':
    main()
