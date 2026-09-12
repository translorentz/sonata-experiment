"""Deterministic, constrained realization of authored four-part counterpoint.

Each state is a quarter-note sonority, including its authored ornaments.
A beam retains alternative paths so an approaching subject entry or cadence
cannot force the preceding free voice into a prohibited progression. Hard
voice-leading constraints are never traded for a lower musical cost.
"""
from __future__ import annotations

import itertools
import numpy as np

PAIRS = tuple(itertools.combinations(range(4), 2))


def frame(state, fixed, tick):
    result = state.copy()
    for v in range(4):
        if fixed[v][tick] is not None:
            result[..., v] = fixed[v][tick]
    return result


def illegal_progressions(a, b):
    """Broadcastable mask; a and b end with a four-voice axis."""
    bad = np.zeros(np.broadcast_shapes(a.shape[:-1], b.shape[:-1]), dtype=bool)
    for i, j in PAIRS:
        active = (a[..., i] >= 0) & (a[..., j] >= 0) & (b[..., i] >= 0) & (b[..., j] >= 0)
        old = np.abs(a[..., i] - a[..., j]) % 12
        new = np.abs(b[..., i] - b[..., j]) % 12
        motion = (b[..., i]-a[..., i]) * (b[..., j]-a[..., j])
        bad |= active & (motion != 0) & (old == new) & np.isin(new, [0, 7])
        if (i, j) == (0, 3):
            bad |= active & (motion > 0) & np.isin(new, [0, 7]) & (np.abs(b[..., i]-a[..., i]) > 2)
    return bad


def ornament_requirements(author, length):
    """Chordal skips must be consonant; ordinary stepwise ornaments may clash.

    A bass passing or neighbor note can make a held chord tone dissonant
    against the *sounding* bass without turning that upper note into a new
    non-chord tone. Track that distinct case explicitly.
    """
    needs_consonance = np.zeros((length, 4), dtype=bool)
    bass_ornament = np.zeros((length, 4), dtype=bool)
    for v, notes in enumerate(author):
        notes = sorted(notes, key=lambda e:e['t'])
        for i, e in enumerate(notes):
            if e['p'] < 0 or e['t'] % 4 == 0:
                continue
            left, right = i-1, i+1
            while left >= 0 and notes[left]['p'] == e['p']:
                left -= 1
            while right < len(notes) and notes[right]['p'] == e['p']:
                right += 1
            if left < 0 or right >= len(notes):
                continue
            if any(notes[j]['t']+notes[j]['d'] != notes[j+1]['t']
                   for j in range(left, right)):
                continue
            a, b = e['p']-notes[left]['p'], notes[right]['p']-e['p']
            step_in, step_out = 0 < abs(a) <= 2, 0 < abs(b) <= 2
            ordinary = (step_in and step_out) or (step_in and a*b < 0) or (abs(a) > 2 and step_out)
            if not ordinary:
                needs_consonance[e['t']:e['t']+e['d'], v] = True
            if step_in and step_out:
                bass_ornament[e['t']:e['t']+e['d'], v] = True
    return needs_consonance, bass_ornament


def realize(fixed, keys, harmonies, ranges, centers, scale, chord, author, width=384):
    total_quarters = len(fixed[0]) // 4
    needs_consonance, bass_ornament = ornament_requirements(author, len(fixed[0]))
    layers, parents = [], []
    previous = np.array([[-1, -1, -1, -1]], dtype=int)
    cost = np.array([0.0])
    for q in range(total_quarters):
        t, bar = q*4, q//4+1
        key, minor = keys[bar-1]
        allowed = {(key+x) % 12 for x in ([0, 2, 3, 5, 7, 8, 10, 11] if minor else scale)}
        candidates = [
            [fixed[v][t]] if fixed[v][t] is not None else
            [p for p in range(lo, hi+1) if p % 12 in allowed]
            for v, (lo, hi) in enumerate(ranges)
        ]
        states = np.array(list(itertools.product(*candidates)), dtype=int)
        valid = np.ones(len(states), dtype=bool)
        unary = np.zeros(len(states), dtype=float)
        active = states >= 0
        bass_voice = np.argmin(np.where(active, states, 999), axis=1)
        pcs = chord(key, minor, harmonies[bar-1][q % 4])
        for i, j in PAIRS:
            present = active[:, i] & active[:, j]
            iv = (states[:, i]-states[:, j]) % 12
            dis = np.isin(iv, [1, 2, 6, 10, 11]) | ((iv == 5) & (bass_voice == j))
            exception = np.zeros(len(states), dtype=bool)
            if 121 <= bar <= 128 and j == 3:
                exception |= states[:, 3] == 50
            if bar == 147 and i == 0:
                exception |= (states[:, 0] == 67) & (states[:, 3] == 50)
            if bar == 148 and 2 in (i, j):
                exception |= (states[:, 2] == 60) & (states[:, 3] == 50)
            valid &= ~present | ~dis | exception
            unary += present * (states[:, i] == states[:, j]) * 8
            if j == i+1 and i < 2:
                unary += present * np.maximum(0, states[:, i]-states[:, j]-19) * .2
        # No crossing, including inside the ornament groups. Free tones are
        # held throughout this beat; the later elaborator checks its additions.
        frames = [frame(states, fixed, t+offset) for offset in range(4)]
        for offset, f in enumerate(frames):
            for i, j in PAIRS:
                present = (f[:, i] >= 0) & (f[:, j] >= 0)
                valid &= ~present | (f[:, i] >= f[:, j])
                if offset:
                    unary += present * np.isin((f[:, i]-f[:, j]) % 12, [1, 2, 6, 10, 11]) * [0, .4, 1.1, .4][offset]
            if offset:
                valid &= ~illegal_progressions(frames[offset-1], f)
                if not 121 <= bar <= 128:
                    low_voice = np.argmin(np.where(f >= 0, f, 999), axis=1)
                    low_pitch = f[np.arange(len(f)), low_voice]
                    bass_is_ornament = bass_ornament[t+offset, low_voice]
                    for v in range(4):
                        if needs_consonance[t+offset, v]:
                            iv = (f[:, v]-low_pitch) % 12
                            valid &= bass_is_ornament | np.isin(iv, [0, 3, 4, 7, 8, 9])
        valid &= ~illegal_progressions(frames[0], frames[2])
        for v in range(4):
            if fixed[v][t] is not None:
                continue
            unary += np.abs(states[:, v]-centers[v]) * .12
            unary += ~np.isin(states[:, v] % 12, list(pcs)) * 2
            # Guide the register toward the next entry before it becomes a
            # hard transition constraint; this is not a substitute for it.
            for ahead in range(1, 9):
                nt = t+4*ahead
                if nt >= len(fixed[v]):
                    break
                target = fixed[v][nt]
                if target is not None and target >= 0:
                    unary += np.maximum(0, np.abs(states[:, v]-target)-2*ahead)**2 * (.8/ahead)
                    break
        for pc in pcs:
            unary += ~np.any((states % 12 == pc) & active, axis=1) * 1.5
        states, unary = states[valid], unary[valid]
        if not len(states):
            raise ValueError(f"No consonant sonority at bar {bar}, beat {q%4+1}.")
        # Candidate rows, predecessor columns; each state retains its best
        # reachable predecessor before the beam is reduced.
        a = previous[None, :, :]
        b = states[:, None, :]
        transition_bad = illegal_progressions(a, b)
        before = frame(previous, fixed, t-1) if q else previous
        if q:
            transition_bad |= illegal_progressions(before[None, :, :], b)
            transition_bad |= illegal_progressions(frame(previous, fixed, t-2)[None, :, :], b)
        distance = np.abs(b-before[None, :, :])
        both = (b >= 0) & (before[None, :, :] >= 0)
        transition_bad |= np.any(both & (distance > 12), axis=2)
        movement = np.sum(np.where(both, distance*.5 + np.maximum(0, distance-4)**2*.9, 0), axis=2)
        movement += np.sum(both & (distance == 0), axis=2) * .6
        # A chromatic leap in an authored minor subject is retained. Avoid
        # adding gratuitous tritones in the free material around it.
        for v in range(4):
            if q and (fixed[v][t] is None or fixed[v][t-1] is None):
                transition_bad |= both[:, :, v] & (distance[:, :, v] == 6)
                # An octave may change register at a phrase boundary; a
                # melodic seventh in a free line has no such justification.
                transition_bad |= both[:, :, v] & np.isin(distance[:, :, v], [10, 11])
                letters = np.array([0,0,1,1,2,3,3,4,4,5,6,6])
                old_letter = 7*(before[:, v]//12)+letters[before[:, v]%12]
                new_letter = 7*(states[:, v]//12)+letters[states[:, v]%12]
                augmented_second = (distance[:, :, v] == 3) & (np.abs(new_letter[:, None]-old_letter[None, :]) == 1)
                transition_bad |= both[:, :, v] & augmented_second
        weights = cost[None, :] + unary[:, None] + movement
        weights[transition_bad] = np.inf
        predecessor = np.argmin(weights, axis=1)
        best = weights[np.arange(len(states)), predecessor]
        reachable = np.flatnonzero(np.isfinite(best))
        if not len(reachable):
            raise ValueError(f"No valid path at bar {bar}, beat {q%4+1}; increase beam or revise authored passage.")
        selected = reachable[np.argsort(best[reachable], kind='stable')[:width]]
        layers.append(states[selected])
        parents.append(predecessor[selected])
        previous, cost = layers[-1], best[selected]
    result = np.empty((total_quarters, 4), dtype=int)
    path = int(np.argmin(cost))
    for q in range(total_quarters-1, -1, -1):
        result[q] = layers[q][path]
        path = int(parents[q][path])
    return result
