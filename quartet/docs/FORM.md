# Formal and contrapuntal account

The movement uses the **separate-exposition double-fugue design**. Subject I
receives a complete four-voice exposition, then development. Subject II is
introduced independently and receives its own four-voice exposition. Only
after those stages do the subjects combine. The combined exposition gives
both themes to all four instruments; later combined entries exchange their
registers, visit related keys and return to a complete tonic group.

## Form

| Bars | Function | Musical action |
|---:|---|---|
| 1–16 | Exposition of I | Viola in G; Violin II answers in D; Violin I enters in G; cello answers in D. The increasing number of independent parts establishes the four-voice texture. |
| 17–24 | First episode | The sigh is shortened into a sequential, eighth-note line and passed among the upper and middle instruments. |
| 25–40 | Middle entries of I | E minor, A minor, C major, G major; each complete entry changes instrumental register and harmonic setting. |
| 41–48 | Bridge and cadence | The episodic line subsides into a G-major cadence. Upper strings take a quarter-note breath while the cello sustains to the next section. |
| 49–64 | Independent exposition of II | Violin II in G; viola in D; cello in G; Violin I in D. Subject I is absent. |
| 65–72 | Second episode | Return of the sequential material in the changed context established by II. |
| 73–80 | Middle entries of II | Viola in G and Violin II in D complete the second subject's independent section. |
| 81–96 | Combined exposition | Both complete subjects sound together four times; each traverses all four instruments. The low sigh and high current exchange their positions in subsequent entries. |
| 97–104 | Sequential episode | C-major region; fragmentation and changes of register separate the combined groups. |
| 105–120 | Combined development | E minor → A minor → C major → D major. The minor statements are diatonic transformations of both subjects. |
| 121–128 | Augmentation and dominant pedal | Violin I gives the entire first subject in doubled note values over D in the cello. The ninth, seventh and fourth above that pedal prolong dominant tension. |
| 129–144 | Final tonic group | Four simultaneous G-major statements pass both subjects through all four instruments again. |
| 145–150 | Coda | The sigh is recalled in a broader tempo; a prepared 4–3 suspension at 147 leads through D7 into the final root-position G-major chord, tied across 149–150. |

## Why the two subjects combine

I is an asymmetrical, ornamented line, beginning with the E–D–E–C–B sigh.
II has a distinct opening fourth, a downward response, and a more regular
quarter/eighth-note motion. Its final B-sixteenth to E-dotted-eighth
rising fourth echoes its opening and supports the sigh's final ornament
when II lies below I. This turn belongs to every statement of II. It is introduced as an independent theme, rather
than being retrospectively promoted from an accompaniment figure.

The pair's intervals on the sixteen quarter-note positions of the four-bar
G-major combination are exclusively thirds and sixths, allowing the subjects
to exchange upper and lower registers. Compound intervals are reduced to
their simple diatonic class below:

| Subject bar | Beat 1 | Beat 2 | Beat 3 | Beat 4 |
|---:|---:|---:|---:|---:|
| 1 | 3rd | 6th | 3rd | 6th |
| 2 | 3rd | 3rd | 3rd | 6th |
| 3 | 6th | 6th | 6th | 3rd |
| 4 | 6th | 6th | 6th | 6th |

These thirds and sixths invert into sixths and thirds. In practice the score
uses compound registers suited to the quartet, including exchange across
two octaves. The source's sixteenth-note ornaments introduce weak-position
passing, neighbor and escape-note dissonances; this is florid tonal
counterpoint, not a claim that every instant is a first-species consonance.
The additional voices provide free counterpoint; they are not two further
fixed subjects.

## Instrumental and harmonic treatment

Every staff is a single melodic part: there are no double stops or hidden
extra voices. The viola uses alto clef; the cello uses bass clef. The three
isolated octave changes occur at phrase/register changes: Violin I at 97,
and Violin II at 113 and 137. A quarter-note viola breath at 113 lets the A-minor entry end before
the lower C-major instrumental texture begins.

The opening does not begin on the tonic pitch: scale degree six belongs to
the borrowed sigh. Tonic and dominant answers, the G-major tonal frame and
later cadences establish the key. The minor regions use diatonic thematic
transformation and the free parts can introduce a raised leading tone.
The final tonic group restores both subjects in G without a modulatory
escape from the closing cadence.

The D pedal under the augmentation deliberately permits upper notes outside
a plain dominant triad. Its E–D motions make the ninth-to-octave relationship
audible; C and G provide seventh/fourth tension within the long dominant
prolongation. This is a pedal passage, not an exception silently discarded
from a consonance count. The coda's G at 147 is prepared, tied across the
change of bass to D, then resolves to F-sharp. The C in the dominant seventh
at 148 resolves down to B in the viola at 149.

## What the audit establishes

`counterpoint-audit.json` checks all six instrument pairs at the sounding
sixteenth-note level and on eighth- and quarter-note reductions. The revised
edition has no similarly moving perfect parallels, no contrary-motion
perfect consecutives at those three levels, no direct outer fifths/octaves
with a leaping upper part, and no voice crossings. Melodic augmented seconds
and sevenths are excluded; the three octave register changes remain visible.

Accented dissonances are checked against the actual lowest voice and between
upper parts. The 15 pedal samples, the prepared suspension at 147, and the
three dominant-seventh samples at 148 are documented rather than hidden.
Weak-note dissonances are classified by melodic approach and resolution,
with a separate category for chord tones against a moving bass ornament.
The new realization also requires chordal skips in I's ornaments to be
consonant, except over the explicit pedal or a bass passing/neighbor note.

Half-note reductions retain 64 candidates for inspection. Each includes the
intervening quarter-note sonority: these reductions omit actual harmonic or
chordal movement, whereas the eighth- and quarter-note checks above omit only
shorter figuration. They are review aids, not a count of 64 errors. The
[revision account](COUNTERPOINT_REVISION.md) records the reasoning and fixes.
The tests and diagnostics do not assign an artistic ranking or claim that
mechanical checks alone can establish equality with Bach.

There is no claim of a full-subject stretto, exact mirror inversion,
retrograde, or additional fugue subject where none is written. None is a
universal requirement of the separate-exposition double fugue. The core
requirements here are distinct subjects, complete independent expositions,
imitative tonal development, their demonstrable contrapuntal combination,
register exchange and an integrated tonic conclusion.

## Complete subject-entry ledger

| Start bar | Subject | Instrument | Key | Length |
|---:|---|---|---|---:|
| 1 | I | Viola | G major | 4 bars |
| 5 | I | Violin II | D major | 4 bars |
| 9 | I | Violin I | G major | 4 bars |
| 13 | I | Violoncello | D major | 4 bars |
| 25 | I | Violin I | E minor | 4 bars |
| 29 | I | Viola | A minor | 4 bars |
| 33 | I | Violin II | C major | 4 bars |
| 37 | I | Violoncello | G major | 4 bars |
| 49 | II | Violin II | G major | 4 bars |
| 53 | II | Viola | D major | 4 bars |
| 57 | II | Violoncello | G major | 4 bars |
| 61 | II | Violin I | D major | 4 bars |
| 73 | II | Viola | G major | 4 bars |
| 77 | II | Violin II | D major | 4 bars |
| 81 | I | Violoncello | G major | 4 bars |
| 81 | II | Violin II | G major | 4 bars |
| 85 | I | Viola | G major | 4 bars |
| 85 | II | Violin I | G major | 4 bars |
| 89 | I | Violin II | D major | 4 bars |
| 89 | II | Violoncello | D major | 4 bars |
| 93 | I | Violin I | G major | 4 bars |
| 93 | II | Viola | G major | 4 bars |
| 105 | I | Violin II | E minor | 4 bars |
| 105 | II | Violoncello | E minor | 4 bars |
| 109 | I | Viola | A minor | 4 bars |
| 109 | II | Violin I | A minor | 4 bars |
| 113 | I | Violin I | C major | 4 bars |
| 113 | II | Violin II | C major | 4 bars |
| 117 | I | Violoncello | D major | 4 bars |
| 117 | II | Violin II | D major | 4 bars |
| 121 | I (augmentation) | Violin I | G major | 8 bars |
| 129 | I | Violin I | G major | 4 bars |
| 129 | II | Violoncello | G major | 4 bars |
| 133 | I | Viola | G major | 4 bars |
| 133 | II | Violin II | G major | 4 bars |
| 137 | I | Violin II | G major | 4 bars |
| 137 | II | Violin I | G major | 4 bars |
| 141 | I | Violoncello | G major | 4 bars |
| 141 | II | Viola | G major | 4 bars |
