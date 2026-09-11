"""The authored subjects must retain invertible structural consonances."""
import importlib.util
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

if __name__=='__main__':unittest.main()
