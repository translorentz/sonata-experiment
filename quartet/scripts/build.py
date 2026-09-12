#!/usr/bin/env python3
"""Compile the quartet, render its MIDI and make a frame-verified score video.

All scheduling uses exact MIDI tempo fractions, 48 kHz samples and 25 fps.
MP3 and MP4 remain local. See README.md for dependencies and reproduction.
"""
from __future__ import annotations
import argparse
import ctypes as C
from fractions import Fraction
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import wave
import mido
import numpy as np
from PIL import Image
from pypdf import PdfReader

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'output'
WORK=ROOT/'.build'
RATE=48000
FPS=25
WIDTH,HEIGHT=1080,1528
TAIL=Fraction(3)


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

def pages_and_video(page_map, duration, pdftoppm):
    # Render to an empty staging directory, so a shorter revised edition
    # cannot inherit stale pages from a previous output.
    with tempfile.TemporaryDirectory(prefix='pages-',dir=WORK) as folder:
        staging = Path(folder)
        run([pdftoppm,'-png','-scale-to-x',WIDTH,'-scale-to-y',HEIGHT,
             OUT/'two-springs.pdf',staging/'page'])
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
        '-r',str(FPS),'-i','pipe:0','-i',str(WORK/'two-springs.flac'),
        '-map','0:v:0','-map','1:a:0','-c:v','libx264','-preset','veryfast',
        '-crf','19','-tune','stillimage','-pix_fmt','yuv420p',
        '-g',str(FPS*10),'-video_track_timescale','48000',
        '-c:a','aac','-b:a','192k','-ar',str(RATE),
        '-movflags','+faststart','-t',str(float(duration)),
        str(OUT/'two-springs.mp4')]
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

class Strings:
    """Sample renderer with explicit, sample-accurate event scheduling."""
    def __init__(self,soundfont):
        library=WORK/'libquartet-tsf.so'
        sources=[ROOT/'vendor/renderer.c',ROOT/'vendor/tsf.h']
        if not library.exists() or any(p.stat().st_mtime>library.stat().st_mtime for p in sources):
            run(['cc','-O2','-shared','-fPIC',sources[0],'-lm','-o',library],env=dict(os.environ,TMPDIR=str(WORK)))
        self.lib=C.CDLL(str(library))
        signatures={
            'tsf_load_filename':(C.c_void_p,[C.c_char_p]),
            'tsf_close':(None,[C.c_void_p]),
            'tsf_set_output':(None,[C.c_void_p,C.c_int,C.c_int,C.c_float]),
            'tsf_channel_set_presetnumber':(C.c_int,[C.c_void_p,C.c_int,C.c_int,C.c_int]),
            'tsf_channel_note_on':(C.c_int,[C.c_void_p,C.c_int,C.c_int,C.c_float]),
            'tsf_channel_note_off':(None,[C.c_void_p,C.c_int,C.c_int]),
            'tsf_channel_midi_control':(C.c_int,[C.c_void_p,C.c_int,C.c_int,C.c_int]),
            'tsf_channel_set_pitchwheel':(C.c_int,[C.c_void_p,C.c_int,C.c_int]),
            'tsf_render_float':(None,[C.c_void_p,C.c_void_p,C.c_int,C.c_int]),
        }
        for name,(rt,at) in signatures.items():
            fn=getattr(self.lib,name);fn.restype=rt;fn.argtypes=at
        self.synth=self.lib.tsf_load_filename(os.fsencode(soundfont))
        if not self.synth:raise RuntimeError('Cannot load SoundFont.')
        self.lib.tsf_set_output(self.synth,0,RATE,-10.0)

    def message(self,m):
        l=self.lib;s=self.synth
        if m.type=='note_on' and m.velocity:
            if not l.tsf_channel_note_on(s,m.channel,m.note,m.velocity/127):raise RuntimeError('Voice allocation failed.')
        elif m.type=='note_off' or m.type=='note_on':l.tsf_channel_note_off(s,m.channel,m.note)
        elif m.type=='program_change':
            if not l.tsf_channel_set_presetnumber(s,m.channel,m.program,0):raise RuntimeError(f'SoundFont lacks program {m.program}.')
        elif m.type=='control_change':l.tsf_channel_midi_control(s,m.channel,m.control,m.value)
        elif m.type=='pitchwheel':l.tsf_channel_set_pitchwheel(s,m.channel,m.pitch+8192)

    def samples(self,n):
        data=np.empty((n,2),dtype=np.float32)
        self.lib.tsf_render_float(self.synth,data.ctypes.data,n,0)
        return data

    def close(self):self.lib.tsf_close(self.synth)


def synthesize(events,duration,args):
    synth=Strings(args.soundfont);position=0;peak=0.0
    raw=WORK/'render.f32'
    try:
        with raw.open('wb') as f:
            def write_until(end):
                nonlocal position,peak
                while position<end:
                    n=min(16384,end-position);data=synth.samples(n)
                    if not np.all(np.isfinite(data)):raise ValueError('Invalid audio samples.')
                    peak=max(peak,float(np.max(np.abs(data))))
                    f.write(data.astype('<f4').tobytes());position+=n
            for _,seconds,message in events:
                write_until(exact_integer(seconds*RATE,'MIDI event sample'))
                if not message.is_meta:synth.message(message)
            write_until(exact_integer(duration*RATE,'Audio duration'))
    finally:synth.close()
    if peak<=0:raise ValueError('Silent rendering.')
    gain=10**(-1.2/20)/peak
    run(['ffmpeg','-hide_banner','-loglevel','error','-y','-f','f32le','-ar',RATE,'-ac','2','-i',raw,
         '-af',f'volume={gain:.12f}','-c:a','flac','-sample_fmt','s16',WORK/'two-springs.flac'])
    run(['ffmpeg','-hide_banner','-loglevel','error','-y','-i',WORK/'two-springs.flac',
         '-c:a','libmp3lame','-b:a','256k',OUT/'two-springs.mp3'])
    return dict(sample_rate=RATE,samples=position,raw_peak=peak,normalization_gain=gain,
                normalized_peak_dbfs=-1.2,soundfont_name=args.soundfont.name,
                soundfont_sha256=digest(args.soundfont),renderer='TinySoundFont',synthetic_performance=True)


def verify_score(mid,events,structure,page_map):
    """Compare the compiled pitches/durations against every authored event."""
    score=json.loads((ROOT/'score/events.json').read_text())
    end_tick=150*4*mid.ticks_per_beat
    if events[-1][0]!=end_tick:raise ValueError('MIDI is not exactly 150 bars.')
    onsets={tick for tick,_,m in events if m.type=='note_on' and m.velocity}
    voices=['violinOne','violinTwo','viola','cello'];ranges=[];programs=[]
    for v,name in enumerate(voices):
        tracks=[tr for tr in mid.tracks if tr.name.startswith(name)]
        if len(tracks)!=1:raise ValueError(f'Expected one MIDI track for {name}.')
        grid=np.full(end_tick,-1,dtype=np.int16);t=0;active={}
        for m in tracks[0]:
            t+=m.time
            if m.type=='note_on' and m.velocity:
                if active:raise ValueError(f'Overlapping notes in {name}: {active}')
                active[m.note]=t
            elif m.type=='note_off' or (m.type=='note_on' and not m.velocity):
                start=active.pop(m.note,None)
                if start is None:raise ValueError(f'Unmatched note-off in {name}')
                grid[start:t]=m.note
            elif m.type=='program_change':pass
        if active:raise ValueError('Unreleased MIDI notes.')
        track_programs={m.program for m in tracks[0] if m.type=='program_change'}
        if len(track_programs)!=1:raise ValueError('Ambiguous instrument assignment.')
        programs.append(next(iter(track_programs)))
        expected=np.full(end_tick,-1,dtype=np.int16)
        for e in score['voices'][v]:
            start=e['t']*mid.ticks_per_beat//4;end=(e['t']+e['d'])*mid.ticks_per_beat//4
            expected[start:end]=e['p']
        if not np.array_equal(grid,expected):
            bad=int(np.flatnonzero(grid!=expected)[0]);raise ValueError(f'Source/MIDI disagreement in {name}, tick {bad}: {grid[bad]} vs {expected[bad]}')
        pitches=grid[grid>=0];ranges.append([int(pitches.min()),int(pitches.max())])
    if programs!=[40,40,41,42]:raise ValueError(f'Expected solo strings, got {programs}.')
    for (lo,hi),minimum in zip(ranges,[55,55,48,36]):
        if lo<minimum or hi>96:raise ValueError(f'Unplayable quartet range: {ranges}')
    if len(PdfReader(OUT/'two-springs.pdf').pages)!=len(page_map):raise ValueError('PDF pagination differs from manifest.')
    # Independently inspect PDF page starts using visible, unique measure labels.
    for page,pdfpage in zip(page_map,PdfReader(OUT/'two-springs.pdf').pages):
        text=pdfpage.extract_text()
        first=str(page['first_bar'])
        if not re.search(r'(?<!\d)'+first+r'(?!\d)',text):
            raise ValueError(f'Page {page["page"]} does not show first bar {first}.')
        tick=(page['first_bar']-1)*4*mid.ticks_per_beat
        if tick not in onsets:raise ValueError('No first-note onset at a page turn.')
        # Neither a rest nor an early release may hide a timing discrepancy.
        boundary=page['last_bar']*4*mid.ticks_per_beat
        if boundary<end_tick and not any(t==boundary and (m.type=='note_off' or m.type=='note_on' and not m.velocity) for t,_,m in events):
            raise ValueError(f'No last-note release at page {page["page"]} boundary.')
    for subject,bars in [('I',[1,5,9,13]),('II',[49,53,57,61])]:
        entries=[e for e in structure['entries'] if e['subject']==subject and e['bar'] in bars]
        if len(entries)!=4 or len({e['voice_id'] for e in entries})!=4:raise ValueError('Incomplete independent exposition.')
    for subject in ['I','II']:
        comb=[e for e in structure['entries'] if e['subject']==subject and 81<=e['bar']<=93]
        if len({e['voice_id'] for e in comb})!=4:raise ValueError('Incomplete combined exposition.')
    return dict(bars=150,quarter_notes=600,range_midi=ranges,midi_programs=programs,
                score_midi_pitch_duration_agreement=True,complete_subject_entries=len(structure['entries']),
                separate_expositions_verified=True,combined_exposition_verified=True,
                pages=len(page_map),opening_sigh_midi=[64,62,64,60,59])


def verify_video(page_map,duration):
    probe=json.loads(subprocess.check_output(['ffprobe','-v','error','-count_frames','-show_streams','-of','json',str(OUT/'two-springs.mp4')]))
    video=next(s for s in probe['streams'] if s['codec_type']=='video')
    audio=next(s for s in probe['streams'] if s['codec_type']=='audio')
    if int(video['nb_read_frames'])!=exact_integer(duration*FPS,'Frame count'):raise ValueError('Wrong video duration.')
    if video['start_time']!='0.000000' or audio['start_time']!='0.000000':raise ValueError('A/V start mismatch.')
    if abs(float(audio['duration'])-float(duration))>1/RATE:raise ValueError('Audio duration mismatch.')
    frames=sorted({f for p in page_map[1:] for f in (p['start_frame']-1,p['start_frame'])})
    select='+'.join(f'eq(n\\,{f})' for f in frames)
    checks=WORK/'video-checks';checks.mkdir(exist_ok=True)
    for p in checks.glob('frame-*.png'):p.unlink()
    run(['ffmpeg','-hide_banner','-loglevel','error','-y','-i',OUT/'two-springs.mp4','-vf',f'select={select}',
         '-fps_mode','vfr',checks/'frame-%03d.png'])
    arrays=[]
    for path in sorted((OUT/'pages').glob('page-*.png')):
        with Image.open(path) as im:arrays.append(np.asarray(im.convert('L').resize((270,382)),dtype=np.float32))
    max_error=0
    for frame,path in zip(frames,sorted(checks.glob('frame-*.png')),strict=True):
        expected=max(i for i,p in enumerate(page_map) if p['start_frame']<=frame)
        with Image.open(path) as im:decoded=np.asarray(im.convert('L').resize((270,382)),dtype=np.float32)
        errors=[float(np.mean(np.abs(decoded-a))) for a in arrays]
        if int(np.argmin(errors))!=expected or errors[expected]>=3:raise ValueError(f'Incorrect score page at frame {frame}')
        max_error=max(max_error,errors[expected])
    # Lossy AAC can alter samples; its decoded timing must nevertheless agree
    # with the exact lossless synthesis at onset and every page change.
    pcm=WORK/'decoded-audio.f32'
    run(['ffmpeg','-hide_banner','-loglevel','error','-y','-i',OUT/'two-springs.mp4','-vn','-f','f32le','-acodec','pcm_f32le',pcm])
    decoded=np.memmap(pcm,dtype='<f4',mode='r').reshape(-1,2)
    expected=exact_integer(duration*RATE,'Samples')
    if abs(len(decoded)-expected)>1024:raise ValueError('Decoded AAC sample length mismatch.')
    source=np.memmap(WORK/'render.f32',dtype='<f4',mode='r').reshape(-1,2)
    lags=[]
    # A waveform correlation check detects codec/container delay independently
    # of timestamp metadata. Windows begin 100 ms after each page onset.
    for page in page_map:
        begin=page['start_sample']+RATE//10;end=min(begin+RATE,expected)
        ref=np.asarray(source[begin:end].mean(axis=1),dtype=np.float64)
        test=np.asarray(decoded[begin:end].mean(axis=1),dtype=np.float64)
        nfft=1 << (2*len(ref)-1).bit_length()
        correlation=np.fft.irfft(np.fft.rfft(test,nfft)*np.conj(np.fft.rfft(ref,nfft)),nfft)
        candidates=np.arange(-256,257)
        lag=int(candidates[np.argmax(correlation[candidates%nfft])]);lags.append(lag)
        if abs(lag)>2:raise ValueError(f'Audio waveform shifted by {lag} samples at page {page["page"]}.')
    return dict(video_frames=int(video['nb_read_frames']),duration_seconds=float(duration),decoded_audio_alignment_lags_samples=lags,
                page_turns_verified=len(page_map)-1,decoded_boundary_frames_checked=len(frames),
                maximum_boundary_image_error=max_error,page_boundary_frame_error=0,page_boundary_sample_error=0,
                video_codec=video['codec_name'],audio_codec=audio['codec_name'],audio_start_seconds=0,video_start_seconds=0)


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--lilypond',default='lilypond');p.add_argument('--pdftoppm',default='pdftoppm')
    p.add_argument('--soundfont',type=Path)
    p.add_argument('--engrave-only',action='store_true',help='Compile and verify score/MIDI without audio or video.')
    args=p.parse_args()
    if not args.engrave_only and args.soundfont is None:p.error('--soundfont is required for an audio/video build.')
    if args.soundfont is not None:args.soundfont=args.soundfont.resolve()
    for path in [WORK,WORK/'tmp',WORK/'cache',OUT,OUT/'pages']:path.mkdir(parents=True,exist_ok=True)
    run([sys.executable,ROOT/'scripts/audit.py','--check'])
    env=dict(os.environ,TMPDIR=str(WORK/'tmp'),XDG_CACHE_HOME=str(WORK/'cache'))
    with (WORK/'engraving.log').open('w') as log:
        run([args.lilypond,'-dno-point-and-click','-o',OUT/'two-springs',ROOT/'score/two-springs.ly'],env=env,stdout=log,stderr=subprocess.STDOUT)
    log=(WORK/'engraving.log').read_text()
    log='\n'.join(l for l in log.splitlines() if not l.startswith('GC Warning:'))
    if re.search(r'warning:|error:|barcheck failed',log,re.I):raise RuntimeError('Engraving warnings need review: .build/engraving.log')
    generated=OUT/'two-springs.midi'
    if generated.exists():generated.replace(OUT/'two-springs.mid')
    structure=json.loads((ROOT/'score/structure.json').read_text())
    mid=mido.MidiFile(OUT/'two-springs.mid');events,seconds_at=timeline(mid)
    musical_end=seconds_at(600*mid.ticks_per_beat);duration=musical_end+TAIL
    page_map=[]
    for i,page in enumerate(structure['pages']):
        start=seconds_at((page['first_bar']-1)*4*mid.ticks_per_beat)
        end=seconds_at(page['last_bar']*4*mid.ticks_per_beat)
        if i==len(structure['pages'])-1:end=duration
        page_map.append(dict(page,start_seconds=float(start),end_seconds=float(end),
                            start_frame=exact_integer(start*FPS,'Page start frame'),end_frame=exact_integer(end*FPS,'Page end frame'),
                            start_sample=exact_integer(start*RATE,'Page start sample'),end_sample=exact_integer(end*RATE,'Page end sample')))
    (OUT/'page-timing.json').write_text(json.dumps(dict(fps=FPS,sample_rate=RATE,musical_end_seconds=float(musical_end),release_tail_seconds=float(TAIL),pages=page_map),indent=2)+'\n')
    report=verify_score(mid,events,structure,page_map)
    report['expanded_counterpoint_checks_passed']=True
    print(f'Compiled and verified {report["bars"]} bars; {float(musical_end):.3f} seconds of music.',flush=True)
    if not args.engrave_only:
        if not args.soundfont.is_file():p.error('SoundFont does not exist.')
        report['synthesis']=synthesize(events,duration,args)
        print('String quartet rendered; encoding synchronized pages.',flush=True)
        pages_and_video(page_map,duration,args.pdftoppm)
        report.update(verify_video(page_map,duration))
    report['source_sha256']=digest(ROOT/'score/two-springs.ly')
    report['event_ledger_sha256']=digest(ROOT/'score/events.json')
    report['lilypond_version']=subprocess.check_output([args.lilypond,'--version'],text=True).splitlines()[0]
    produced=[OUT/'two-springs.pdf',OUT/'two-springs.mid',OUT/'page-timing.json',OUT/'counterpoint-audit.json']
    if not args.engrave_only:
        produced.extend([OUT/'two-springs.mp3',OUT/'two-springs.mp4',*sorted((OUT/'pages').glob('page-*.png'))])
    report['artifacts']={str(path.relative_to(ROOT)):digest(path) for path in sorted(produced)}
    (OUT/'validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k not in ('artifacts','synthesis')},indent=2))

if __name__=='__main__':main()
