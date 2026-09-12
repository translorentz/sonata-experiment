# Counterpoint revision, 12 September 2026

This edition replaces the counterpoint of commit
`4bc1b15ccba7468a65812f48ba01cb1da1287a2f`. The earlier audit checked only
adjacent simultaneous changes; its clean result did not establish sound
structural voice leading. The revised score addresses the reported passages
and broadens the checks across all 150 bars.

## Musical changes

- Subject I, including all source-derived pitches and rhythms, is preserved.
- Subject II retains its four-bar shape and all sixteen structural pitches.
  Its final B quarter is now B sixteenth followed by E dotted eighth, a rising
  fourth that recalls its opening. Every independent and combined statement
  uses this ending. In the lower register, E supports the sigh's E-G-A run;
  the former sustained B made the first of those notes an unsupported fourth.
- Supporting voices are rewritten with consonant structural sonorities,
  more independent motion and controlled melodic intervals. The realization
  retains alternative paths across entries and cadences. A forbidden
  progression cannot be accepted in exchange for a better numerical score.
- The cello has explicitly written eighth-note motion in bars 96 and 116.
  In 96, G2 half note, A2 eighth, D3 eighth, G2 quarter supports the subject's
  A4-E5-D5 gesture without a concealed fifth or an awkward melodic seventh.
  Bar 116 uses the corresponding C3-D3-G3-C3 bass.
- The viola and cello are revised in 145; the cello also changes in 146.
  The prepared 4-3 suspension in 147 and D7-G conclusion remain.
- Both independent expositions, all 39 complete subject entries, the combined
  traversal, augmentation, tonal itinerary, 150 bars and page clock remain.

## Previously reported passages

Pitches are written upper part / lower part; C4 is middle C.

| Passage | Revised voice leading | Result |
|---|---|---|
| 20, beats 2-3, viola/cello | A3/C3 to F#3/D3 | Sixth to third, with contrary motion. |
| 26, beats 3-4, violins | F#4/A3 to E4/C4 | Sixth to third; the former unison doubling is removed. |
| 96, beats 3-4, violin I/cello | A4/A2, E5/D3, D5/G2 | The written bass eighth changes the intermediate interval; both the surface and beat reduction pass. |
| 137, beats 3-4, violin II/cello | D4/D3 to C4/A2 | Octave to third; the lower line supplies a different harmony. |
| 142, beats 3-4, violin I/cello | E5/A2 to E5/G2 | The upper part holds while the bass moves. |
| 145, beat 4, violin I/cello | E5/D3 to C5/A2 | The arrival is a third rather than the former direct octave. |
| 146, beats 3-4, violin I/cello | C5/C3 to A4/D3 | Contrary motion into the fifth. |

## Full-score verification

The independently run audit reports zero findings for:

- Parallel fifths, octaves and unisons at sixteenth, eighth and quarter levels.
- Contrary-motion consecutive perfect intervals at those same levels.
- Direct outer perfect intervals with a leaping upper voice, both on the
  note surface and between quarter-note positions.
- Voice crossings, including weak subdivisions.
- Unexplained accented dissonances against the bass or between upper voices.
- Unclassified weak-note dissonances, melodic augmented seconds, melodic
  sevenths and leaps larger than an octave.

The three octave shifts are phrase/register changes: violin I at 97 and
violin II at 113 and 137. The dominant pedal produces 15 accented dissonance
samples; the prepared 4-3 suspension contributes one; the resolving dominant
seventh contributes three. Upper-voice dissonances associated with that
suspension and seventh are identified explicitly. A sustained pedal is not
treated as a license for arbitrary dissonance between the other parts.

Weak-note dissonances are checked through their approach and departure:
passing and neighbor notes, escape notes, and unaccented appoggiaturas.
A held or rearticulated chord tone over a passing/neighbor bass is identified
separately; it is not incorrectly treated as a new dissonant ornament in the
upper voice. Pedal figuration is also separately documented.

## Longer reductions and limits of the test

The JSON report retains 64 half-note-reduction candidates, with the
intervening quarter-note sonority printed for every one. These are not
literal or beat-to-beat parallels. The skipped quarter carries actual
harmonic or chordal movement. For example, the closing C-major sonority in
146 and G-major sonority in 147 have an intervening D-major chord; deleting
that dominant generates an artificial pair of outer octaves. Similarly,
the intermediate sonorities in the sequential episodes establish their own
bass and chord members rather than merely inserting a sixteenth passing
note into a prohibited progression.

This distinction follows the difference between a surface non-chord tone
and intervening chordal movement discussed, with score examples, in
[Luke Dahn, *How Bach Prevented Consecutive Fifths and Octaves*](https://lukedahn.wordpress.com/2016/05/29/bach-and-consecutive-p5sp8s-part-2-how-he-prevented-them/).
The final score deliberately uses the stricter choice of excluding even
contrary-motion perfect consecutives from the surface and beat checks.

The regression tests include the old bar-96 concealed fifth and bar-26
ornamented unisons, along with direct octaves, contrary octaves and rests
that break a contrapuntal connection. Every completed build reruns the audit
and compares every compiled MIDI pitch and duration with the reviewed ledger.
Page boundaries are independently checked in the encoded video and decoded
AAC audio. These checks establish the stated technical properties; they do
not constitute an objective artistic grade.
