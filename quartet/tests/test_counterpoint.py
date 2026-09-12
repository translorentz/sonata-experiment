"""Regression checks for the actual blind spots in the first edition."""
import importlib.util
import json
from pathlib import Path
import unittest
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('quartet_audit', ROOT/'scripts/audit.py')
audit = importlib.util.module_from_spec(spec)
spec.loader.exec_module(audit)


class CounterpointTests(unittest.TestCase):
    def test_ornament_does_not_hide_structural_fifths(self):
        # Bar 96 in the superseded edition: A4-E5-D5 over D3-G3.
        grid = np.full((16, 4), -1)
        grid[:2, 0], grid[2:4, 0], grid[4:, 0] = 69, 76, 74
        grid[:4, 3], grid[4:, 3] = 50, 55
        self.assertEqual(audit.perfect_parallels(grid), [])
        found = audit.perfect_parallels(grid, 4)
        self.assertEqual(len(found), 1)
        self.assertEqual(found[0]['interval'], 'fifth')

    def test_escape_note_does_not_hide_parallel_unisons(self):
        # F#4-G4-E4 against F#4-E4, the old bar 26.
        grid = np.full((16, 4), -1)
        grid[:3, 0], grid[3:4, 0], grid[4:, 0] = 66, 67, 64
        grid[:4, 1], grid[4:, 1] = 66, 64
        self.assertEqual(audit.perfect_parallels(grid), [])
        self.assertEqual(len(audit.perfect_parallels(grid, 2)), 1)
        self.assertEqual(len(audit.perfect_parallels(grid, 4)), 1)

    def test_rest_releases_structural_connection(self):
        grid = np.full((16, 4), -1)
        grid[:4, 0], grid[4:, 0] = 69, 74
        grid[:4, 3], grid[4:, 3] = 50, 55
        grid[2:4, 0] = -1
        self.assertEqual(audit.perfect_parallels(grid, 4), [])

    def test_direct_outer_octave_with_soprano_leap(self):
        grid = np.full((16, 4), -1)
        grid[:4, 0], grid[4:, 0] = 76, 72
        grid[:4, 3], grid[4:, 3] = 50, 48
        self.assertEqual(len(audit.direct_outer_perfects(grid)), 1)
        grid[:4, 0] = 74  # Stepwise soprano is a different convention.
        self.assertEqual(audit.direct_outer_perfects(grid), [])

    def test_contrary_octaves_are_reported_separately(self):
        grid = np.full((16, 4), -1)
        grid[:4, 0], grid[4:, 0] = 72, 67
        grid[:4, 3], grid[4:, 3] = 48, 55
        self.assertEqual(audit.perfect_parallels(grid), [])
        self.assertEqual(len(audit.perfect_parallels(grid, contrary=True)), 1)

    def test_non_contiguous_events_are_rejected(self):
        voice = [{'t': 0, 'p': 60, 'd': 8}, {'t': 9, 'p': 62, 'd': 7}]
        with self.assertRaises(ValueError):
            audit.sounding_grid([voice for _ in range(4)])

    def test_published_score_passes_expanded_checks(self):
        events = json.loads((ROOT/'score/events.json').read_text())['voices']
        result = audit.analyze(events)
        self.assertEqual(result['bars'], 150)
        audit.check(result)


if __name__ == '__main__':
    unittest.main()
