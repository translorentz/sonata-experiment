"""Clock tests cover tempo boundaries, fractional ticks and refusal to round."""
import importlib.util
from pathlib import Path
from fractions import Fraction
import unittest
import mido
spec=importlib.util.spec_from_file_location('quartet_build',Path(__file__).resolve().parents[1]/'scripts/build.py')
build=importlib.util.module_from_spec(spec);spec.loader.exec_module(build)

class ClockTests(unittest.TestCase):
    def test_mid_beat_tempo_change(self):
        mid=mido.MidiFile(ticks_per_beat=480)
        mid.tracks.append(mido.MidiTrack([
            mido.MetaMessage('set_tempo',tempo=600000,time=0),
            mido.Message('note_on',note=60,velocity=80,time=0),
            mido.MetaMessage('set_tempo',tempo=750000,time=240),
            mido.Message('note_off',note=60,time=240),
            mido.MetaMessage('end_of_track',time=480),
        ]))
        events,at=build.timeline(mid)
        self.assertEqual(at(240),Fraction(3,10))
        self.assertEqual(at(480),Fraction(27,40))
        self.assertEqual(events[-1][1],Fraction(57,40))
        self.assertEqual(build.exact_integer(at(480)*48000,'sample'),32400)

    def test_different_track_event_order(self):
        mid=mido.MidiFile(ticks_per_beat=960)
        mid.tracks.extend([
            mido.MidiTrack([mido.MetaMessage('set_tempo',tempo=500000),mido.MetaMessage('set_tempo',tempo=1000000,time=960)]),
            mido.MidiTrack([mido.Message('note_on',note=64,velocity=70,time=480),mido.Message('note_off',note=64,time=960)])
        ])
        events,at=build.timeline(mid)
        release=next(t for _,t,m in events if m.type=='note_off')
        self.assertEqual(release,Fraction(1))
        self.assertEqual(at(1440),release)

    def test_page_turn_cannot_be_rounded(self):
        with self.assertRaises(ValueError):build.exact_integer(Fraction(1,3)*25,'page frame')
        self.assertEqual(build.exact_integer(Fraction(144,5)*25,'page frame'),720)

if __name__=='__main__':unittest.main()
