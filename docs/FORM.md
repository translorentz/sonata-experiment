# Form and compositional account

The movement follows the conventional three-part sonata design:
**exposition (1–72), development (73–120), recapitulation (121–192),
followed by a coda (193–200)**. The opening four bars belong to the primary
group: their slower tempo gives them the character of a remembered song.

Sonata form is a family of practices rather than one immutable checklist.
The requirements applied here are thematic presentation, a tonal departure,
developmental transformation, prepared return, and tonal resolution. A
slow introduction, an exposition repeat, and a coda are optional conventions.
For the terminology, see the authored teaching chapter
[Open Music Theory: Sonata Form](https://viva.pressbooks.pub/openmusictheory/chapter/sonata-form/).
The measure-specific analysis below describes this composition.

## Requirements and how they are fulfilled

| Formal requirement | Bars | Realization in the score |
|---|---:|---|
| Primary theme establishes the tonic | 1–24 | G-major primary group. Bars 1–4 give the adapted source incipit; 5–8 answer it. At 9 the sigh becomes flowing Allegro material. The expanded continuation at 17–24 closes with D7–G and soprano G. |
| Transition creates energy and leaves the tonic | 25–40 | Sixteenth-note diminution and sequential ascent lead through E minor, B minor and A harmony. C-sharp and an A-dominant lock prepare D. Bar 40 ends on A, the dominant of the coming secondary key. |
| Medial articulation separates the thematic groups | 40–41 | A-major half cadence in D, followed by a half-bar rest in both hands. Bar 41 begins the second subject in D, with a softer dynamic, longer note values and a broader tempo. |
| Secondary theme contrasts in a related key | 41–64 | D major. The half-note singing line and arpeggiated support contrast with TR's clipped chords and rapid cells. Falling steps connect it to the sigh without merely repeating P. |
| Cadential confirmation of the secondary key | 47–48, 55–56, 63–64 | The first S phrase ends with an imperfect authentic arrival: soprano F-sharp over D at 48. A7 goes deceptively to B minor at 56. The extension finally gives A7–D with soprano D at 64, the essential expositional closure. |
| Closing group consolidates the exposition's destination | 65–72 | Brighter articulated D-major material and reiterated A7–D cadences. Both hands release into a half-bar rest at 72. |
| Development transforms existing material and destabilizes tonality | 73–104 | B minor → E minor → A minor, then F/C-minor/E-flat regions. The sigh is sequenced, transferred to the bass, inverted in contour, and compressed into sixteenths; chromatic harmony drives the climax. |
| Retransition prepares the tonic return | 105–120 | Diminished sonority and German augmented sixth lead toward G's dominant. The texture progressively thins; bars 113–120 hold an explicit D pedal and reduce the motif to falling steps. Tempo and dynamics subside before the return. |
| Recapitulation restores the primary material in the tonic | 121–144 | P returns in G with its original phrase order; a flowing left hand now supports the incipit that was first heard over sustained harmonies. |
| Recapitulation resolves the earlier tonal opposition | 145–184 | The transition is recomposed to prepare D as G's dominant rather than A as D's dominant. S returns at 161 transposed down a fifth into G; its imperfect and deceptive arrivals are retained. D7–G at 183–184 gives the essential structural closure. |
| Closing material also returns in the tonic | 185–192 | The exposition's closing group is transposed into G, with final dominant–tonic confirmation. |
| Final tonic closure | 193–200 | The coda recalls the sigh, briefly colors it with C minor, then expands G/D–D7–G gestures. Bars 199–200 give root-position D–G and a soprano G in the final chord. |

## Thematic work

The source's first cell is **E–D–E–C–B**: descent, recovery, and a larger
descent. The answer continues through A, G, and B, then rises toward D and E.
Those asymmetric gestures supply both the melodic line and its development.

| Device | Examples | Audible purpose |
|---|---|---|
| Metrical expansion | 1; return at 121 | The source's two-beat opening becomes a complete four-beat bar; the pitches remain identifiable. |
| Rhythmic activation | 9–16 | The head loses its initial silence and moves in eighths. |
| Diminution and sequence | 25–31; 145–151 | Sixteenths and rising harmonic destinations create transitional momentum. |
| Transfer between hands | 73–80; 81–88 | A treble statement is answered in the bass beneath an independent upper line. These are imitative exchanges, not a claim of strict canon. |
| Contour inversion | 89–92 | A–B–A–C–D reverses the head's down–up–down–down directions. Intervals are adjusted diatonically; this is a tonal contour inversion, not an exact chromatic mirror. |
| Fragmentation and liquidation | 109–120 | The complete head contracts to paired falling steps and then bare dominant preparation. |
| Reharmonization | 193–196 | A C-minor echo shadows the closing recollection before G reasserts itself. |

## Harmonic details and limits of the labels

The ledger in `score/composition.json` records each bar's accompaniment
source and melodic notation. Its harmony field is a compositional scaffold,
not an exhaustive Roman-numeral analysis: passing and neighboring tones,
changes within a bar, and the deliberately added ninth above the dominant
pedal are audible in the score. For transposed recap bars the ledger retains
the source chord label and explicitly records the transposition.

The augmented-sixth sonority at 106 is E-flat–G–B-flat–C-sharp. Its resolution
is deliberately expanded: the following bar starts with tonic harmony over D,
then includes an A7-colored upper sonority before D7. This is a chromatic
retransition, not a textbook four-part resolution exercise.

The opening is tonally G major even though the melody begins on scale degree
6 and includes modal inflections from its source. The piano harmony and
cadences establish G; the development's minor regions create a substantial
departure from that center.

There is no exposition repeat. All notes are written out, all 200 bar lengths
are checked by LilyPond, and the MIDI contains exactly 800 quarter-note beats.
The coda is included as an expressive decision, not as a universal requirement
of sonata form. Artistic quality remains a matter for performance and
listening; the formal and technical claims are inspectable in the score.
