"""The authored subjects must retain invertible structural consonances."""
import importlib.util
import json
from pathlib import Path
import unittest
spec=importlib.util.spec_from_file_location('quartet_compose',Path(__file__).resolve().parents[1]/'scripts/compose.py')
compose=importlib.util.module_from_spec(spec);spec.loader.exec_module(compose)

class SubjectPairTests(unittest.TestCase):
    def test_all_structural_intervals_survive_register_exchange(self):
        a=[p for p,d in compose.A for _ in range(d)]
        b=[p for p,d in compose.B for _ in range(d)]
        self.assertEqual(len(a),64);self.assertEqual(len(b),64)
        for t in range(0,64,4):
            # Major/minor thirds and sixths, before and after octave exchange.
            self.assertIn((b[t]-a[t])%12,{3,4,8,9})
            self.assertIn((a[t]-(b[t]-24))%12,{3,4,8,9})

    def test_revised_tail_supports_the_sigh_in_the_lower_register(self):
        a=[p for p,d in compose.A for _ in range(d)]
        b=[p for p,d in compose.B for _ in range(d)]
        # The original bass B made the E ornament a fourth. The new E
        # supports the E-G pair as an octave and a third.
        self.assertEqual((a[61]-(b[61]-24))%12,0)
        self.assertEqual((a[62]-(b[62]-24))%12,3)

    def test_every_published_entry_retains_the_complete_subject(self):
        events=json.loads((compose.ROOT/'score/events.json').read_text())['voices']
        for entry in compose.ENTRIES:
            material=compose.B if entry['subject']=='II' else compose.A
            multiplier=2 if entry['subject']=='I (augmentation)' else 1
            start=(entry['bar']-1)*16
            expected=[]
            for p,d in material:
                pitch=compose.transform(p,entry['key'],entry['minor'],entry['octave'])
                expected.append((start,pitch,d*multiplier))
                start+=d*multiplier
            actual=[(e['t'],e['p'],e['d']) for e in events[entry['voice_id']]
                    if (entry['bar']-1)*16<=e['t']<start]
            self.assertEqual(actual,expected,entry)

if __name__=='__main__':unittest.main()
