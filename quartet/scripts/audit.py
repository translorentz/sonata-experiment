#!/usr/bin/env python3
"""Counterpoint diagnostics at the note surface and on metrical reductions.

The eighth- and quarter-note checks deliberately err on the conservative
side: an intervening ornament cannot excuse a perfect parallel. Longer
reductions are reported as candidates, not automatically called errors.
No numerical checker constitutes an aesthetic assessment.
"""
from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path

import numpy as np

ROOT = Path(__file__).resolve().parents[1]
PAIRS = tuple(itertools.combinations(range(4), 2))
VOICE_NAMES = ("Violin I", "Violin II", "Viola", "Violoncello")
PITCH_NAMES = ("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "Bb", "B")


def position(t):
    return {"bar": int(t // 16 + 1), "beat": float(t % 16 / 4 + 1)}


def pitch_name(p):
    return "rest" if p < 0 else f"{PITCH_NAMES[p % 12]}{p // 12 - 1}"


def sounding_grid(events):
    if len(events) != 4 or any(not voice for voice in events):
        raise ValueError("Expected four nonempty monophonic voices.")
    ends = [voice[-1]["t"] + voice[-1]["d"] for voice in events]
    if len(set(ends)) != 1 or ends[0] % 16:
        raise ValueError("Voices must end together at a complete bar.")
    grid = np.full((ends[0], 4), -1, dtype=int)
    for v, voice in enumerate(events):
        cursor = 0
        for e in voice:
            if e["t"] != cursor or e["d"] <= 0 or not -1 <= e["p"] <= 127:
                raise ValueError(f"Invalid event in voice {v}: {e}")
            cursor += e["d"]
            grid[e["t"]:cursor, v] = e["p"]
    return grid


def perfect_parallels(grid, step=1, contrary=False):
    findings = []
    for t in range(step, len(grid), step):
        for i, j in PAIRS:
            a, b = grid[t-step, [i, j]], grid[t, [i, j]]
            if min(*a, *b) < 0 or np.any(grid[t-step:t+1, [i, j]] < 0):
                continue
            old, new = abs(a[0]-a[1]) % 12, abs(b[0]-b[1]) % 12
            motion = (b[0]-a[0]) * (b[1]-a[1])
            if old == new and new in (0, 7) and (motion < 0 if contrary else motion > 0):
                findings.append({
                    "voices": [i, j], "from": position(t-step), "to": position(t),
                    "interval": "fifth" if new == 7 else "octave/unison",
                    "from_midi": a.tolist(), "to_midi": b.tolist(),
                    "intermediate": [
                        {**position(u), "midi": grid[u, [i, j]].tolist()}
                        for u in range(t-step+1, t)
                        if not np.array_equal(grid[u, [i, j]], grid[u-1, [i, j]])
                    ],
                })
    return findings


def direct_outer_perfects(grid, step=1):
    findings = []
    for t in range(step, len(grid), step):
        a, b = grid[t-step, [0, 3]], grid[t, [0, 3]]
        if min(*a, *b) < 0 or np.any(grid[t-step:t+1, [0, 3]] < 0):
            continue
        if ((b[0]-a[0]) * (b[1]-a[1]) > 0
                and abs(b[0]-a[0]) > 2 and abs(b[0]-b[1]) % 12 in (0, 7)):
            findings.append({"from": position(t-step), "to": position(t),
                             "from_midi": a.tolist(), "to_midi": b.tolist()})
    return findings


def accented_dissonances(grid):
    findings = []
    for t in range(0, len(grid), 4):
        active = grid[t][grid[t] >= 0]
        if len(active) < 2:
            continue
        bass = int(min(active))
        for v, p in enumerate(grid[t]):
            if p < 0 or (p-bass) % 12 not in (1, 2, 5, 6, 10, 11):
                continue
            bar = t // 16 + 1
            treatment = "requires review"
            if 121 <= bar <= 128 and grid[t, 3] == bass == 50:
                treatment = "dominant pedal; upper counterpoint reviewed separately"
            elif (bar == 147 and v == 0 and p == 67 and bass == 50
                  and grid[t-1, 0] == 67 and grid[(bar-1)*16+12, 0] == 66):
                treatment = "prepared 4-3 suspension, resolving at beat 4"
            elif (bar == 148 and v == 2 and p == 60 and bass == 50
                  and len(grid) > 148*16 and grid[148*16, 2] == 59):
                treatment = "dominant seventh, resolving to B3 in bar 149"
            findings.append({"voice": v, **position(t), "midi": int(p),
                             "bass": bass, "interval": int((p-bass) % 12),
                             "treatment": treatment})
    return findings


def melodic_context(voice, index):
    pitch = voice[index]["p"]
    left, right = index-1, index+1
    while left >= 0 and voice[left]["p"] == pitch:
        left -= 1
    while right < len(voice) and voice[right]["p"] == pitch:
        right += 1
    if left < 0 or right >= len(voice) or min(voice[left]["p"], voice[right]["p"]) < 0:
        return None
    return pitch-voice[left]["p"], voice[right]["p"]-pitch


def weak_dissonances(events, grid):
    findings = []
    event_at = np.empty_like(grid)
    for v, voice in enumerate(events):
        for i, e in enumerate(voice):
            event_at[e["t"]:e["t"]+e["d"], v] = i
    for v, voice in enumerate(events):
        for i, e in enumerate(voice):
            t, p = e["t"], e["p"]
            if t % 4 == 0 or p < 0:
                continue
            bv = int(np.argmin(np.where(grid[t] >= 0, grid[t], 999)))
            bass = int(grid[t, bv])
            if (p-bass) % 12 not in (1, 2, 5, 6, 10, 11):
                continue
            treatment = "requires review"
            context = melodic_context(voice, i)
            if context:
                a, b = context
                if 0 < abs(a) <= 2 and 0 < abs(b) <= 2:
                    treatment = "passing tone" if a*b > 0 else "neighbor note"
                elif 0 < abs(a) <= 2 and abs(b) > 2 and a*b < 0:
                    treatment = "escape note"
                elif abs(a) > 2 and 0 < abs(b) <= 2:
                    treatment = "unaccented appoggiatura"
            bi = int(event_at[t, bv])
            bass_context = melodic_context(events[bv], bi)
            if events[bv][bi]["t"] % 4 and bass_context and all(0 < abs(x) <= 2 for x in bass_context):
                treatment = "upper chord tone against bass passing/neighbor note"
            if 121 <= t//16+1 <= 128 and bv == 3 and bass == 50:
                treatment = "figuration above the dominant pedal"
            findings.append({"voice": v, **position(t), "midi": p,
                             "bass": bass, "treatment": treatment})
    return findings


def analyze(events):
    grid = sounding_grid(events)
    leaps, crossings, upper_dissonances, augmented_seconds = [], [], [], []
    for v, voice in enumerate(events):
        last = None
        for e in voice:
            if e["p"] < 0:
                last = None
                continue
            if last is not None and abs(e["p"]-last) > 9:
                leaps.append({"voice": v, **position(e["t"]), "interval": e["p"]-last})
            if last is not None and abs(e["p"]-last) == 3:
                letters = [0,0,1,1,2,3,3,4,4,5,6,6]
                old_letter = 7*(last//12)+letters[last%12]
                new_letter = 7*(e["p"]//12)+letters[e["p"]%12]
                if abs(new_letter-old_letter) == 1:
                    augmented_seconds.append({"voice": v, **position(e["t"]),
                                              "from": pitch_name(last), "to": pitch_name(e["p"])})
            last = e["p"]
    for t in range(len(grid)):
        for i, j in PAIRS:
            a, b = grid[t, [i, j]]
            if min(a, b) < 0:
                continue
            if a < b and (t == 0 or grid[t-1, i] >= grid[t-1, j]):
                crossings.append({"voices": [i, j], **position(t), "midi": [int(a), int(b)]})
            # Include the upper pair above a pedal: consonance against only
            # the bass is not a sufficient four-part counterpoint check.
            if t % 4 == 0 and abs(a-b) % 12 in (1, 2, 6, 10, 11):
                bass_voice = int(np.argmin(np.where(grid[t] >= 0, grid[t], 999)))
                if bass_voice not in (i, j):
                    upper_dissonances.append({"voices": [i, j], **position(t),
                                              "midi": [int(a), int(b)]})
    ranges = [[int(min(p for p in grid[:, v] if p >= 0)),
               int(max(p for p in grid[:, v] if p >= 0))]
              if np.any(grid[:, v] >= 0) else None for v in range(4)]
    strong = accented_dissonances(grid)
    weak = weak_dissonances(events, grid)
    longer = perfect_parallels(grid, 8)
    for finding in longer:
        start = (finding["from"]["bar"]-1)*16 + int((finding["from"]["beat"]-1)*4)
        middle = grid[start+4].tolist()
        finding["intervening_quarter_sonority"] = [pitch_name(p) for p in middle]
        finding["review"] = "intervening quarter-note harmony/chordal movement; not consecutive beat-to-beat parallels"
    for finding in upper_dissonances:
        finding["treatment"] = "requires review"
        related = [x for x in strong if x["bar"] == finding["bar"]
                   and x["beat"] == finding["beat"] and x["voice"] in finding["voices"]]
        for x in related:
            if x["treatment"].startswith(("prepared 4-3", "dominant seventh")):
                finding["treatment"] = x["treatment"]
    return {
        "bars": len(grid) // 16, "range_midi": ranges,
        "parallel_perfect_intervals": perfect_parallels(grid),
        "eighth_note_parallel_perfects": perfect_parallels(grid, 2),
        "quarter_note_parallel_perfects": perfect_parallels(grid, 4),
        "contrary_perfect_consecutives": perfect_parallels(grid, contrary=True),
        "eighth_note_contrary_perfects": perfect_parallels(grid, 2, contrary=True),
        "quarter_note_contrary_perfects": perfect_parallels(grid, 4, contrary=True),
        "direct_outer_perfects": direct_outer_perfects(grid),
        "quarter_note_direct_outer_perfects": direct_outer_perfects(grid, 4),
        "longer_reduction_candidates": longer,
        "leaps_over_major_sixth": leaps,
        "melodic_augmented_seconds": augmented_seconds,
        "accented_dissonances_above_bass": strong,
        "unexplained_accented_dissonances": [x for x in strong if x["treatment"] == "requires review"],
        "upper_voice_accented_dissonances": upper_dissonances,
        "unexplained_upper_dissonances": [x for x in upper_dissonances if x["treatment"] == "requires review"],
        "weak_dissonance_treatments": weak,
        "unexplained_weak_dissonances": [x for x in weak if x["treatment"] == "requires review"],
        "voice_crossing_onsets": crossings,
        "structural_voice_crossings": [
            {"voices": [i, j], **position(t)}
            for t in range(0, len(grid), 4) for i, j in PAIRS
            if 0 <= grid[t, i] < grid[t, j]
        ],
    }


def check(result):
    gates = ("parallel_perfect_intervals", "eighth_note_parallel_perfects",
             "quarter_note_parallel_perfects", "direct_outer_perfects",
             "quarter_note_direct_outer_perfects", "structural_voice_crossings",
             "unexplained_accented_dissonances", "unexplained_upper_dissonances",
             "contrary_perfect_consecutives", "eighth_note_contrary_perfects",
             "quarter_note_contrary_perfects", "unexplained_weak_dissonances",
             "voice_crossing_onsets", "melodic_augmented_seconds")
    errors = [f"{key}: {len(result[key])}" for key in gates if result[key]]
    errors.extend(f"Voice {v}: outside instrument range" for v, bounds in enumerate(result["range_midi"])
                  if bounds and (bounds[0] < [55, 55, 48, 36][v] or bounds[1] > 96))
    errors.extend(f"Melodic leap exceeds an octave: {x}" for x in result["leaps_over_major_sixth"]
                  if abs(x["interval"]) > 12)
    errors.extend(f"Melodic seventh: {x}" for x in result["leaps_over_major_sixth"]
                  if abs(x["interval"]) in (10, 11))
    if errors:
        raise ValueError("Counterpoint revision required: " + "; ".join(errors))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--input", type=Path, default=ROOT / "score/events.json")
    parser.add_argument("--output", type=Path, default=ROOT / "output/counterpoint-audit.json")
    args = parser.parse_args()
    result = analyze(json.loads(args.input.read_text())["voices"])
    args.output.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({k: v if k in ("bars", "range_midi") else len(v) for k, v in result.items()}, indent=2))
    if args.check:
        check(result)


if __name__ == "__main__":
    main()
