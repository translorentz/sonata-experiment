# Source motif and attribution

**Thematic source:** Hua Yanjun (Abing), *Erquan Yingyue* (*The Moon Reflected
in the Second Spring*). The underlying melody is the public-domain material
specified in the commission. This repository contains a new piano movement,
not a transcription of an existing piano arrangement.

The reference was checked against:

1. [Jiebing Chen, “The Erhu”](https://www.jiebingchen.com/erhu), which identifies
   and displays the opening in both staff notation and numbered notation.
   The accompanying explanation identifies the opening degree 6 as E when
   1 = G. [Displayed notation image](https://images.squarespace-cdn.com/content/v1/5a8f3404a9e0280d078becb8/1521430538644-PNMVB9N6GRDREX9O852X/er_chuan_duoNu.gif).
2. [Complete numbered notation, first page, transcribed by Yu Yihui](https://www.qupu123.com/puyou/shangchuan/p357645.html),
   used to inspect the full four-bar incipit. The score credits Hua Yanjun
   and Yang Yinliu, with later fingering/editorial credits.
   [Displayed first-page image](https://www.qupu123.com/Public/Uploads/2020/04/18/5139805e9b05065a7d3.jpg).

Consulted 10 September 2026. The reference page images themselves are not
redistributed in this repository.

## Exact relationship to bars 1–4

The reference's first written bar is a two-beat introductory gesture, although
the ensuing meter is 4/4. This edition **doubles the rhythmic values of that
short first bar**, making it a full 4/4 measure. Its pitch order is retained.
The next three bars preserve the melodic outline and principal rhythmic
values; erhu slides, bowing, fingerings, and the indicated trill are omitted.
The register is selected for piano and the harmony is newly composed.

| Bar in this movement | Pitch sequence, ignoring repeated articulations and octave placement |
|---:|---|
| 1 | rest; E–D–E–C–B |
| 2 | A–A–B–G–G–A |
| 3 | B–D–E–D–E–D–E–G |
| 4 | D–B–D–D–B–A–E–D–E–G–A |

Thus “four-bar motif” here means a **four-bar metrical adaptation of the
opening incipit**, not a claim that every source edition has four full bars
with identical editorial ornamentation. The first five MIDI melody notes
are independently checked as E5, D5, E5, C5, B4.

Bars 5–120 and the coda are newly composed. The recapitulation intentionally
recalls and transforms the exposition's material. No existing arrangement's
piano accompaniment, voicing, or formal expansion was copied.

## Rendering references

- [LilyPond: creating MIDI files](https://lilypond.org/doc/v2.24/Documentation/notation/creating-midi-files):
  the layout and MIDI are compiled from the same music; tempo and dynamics
  are encoded in the MIDI.
- [LilyPond downloads](https://lilypond.org/download.html): the edition uses
  the versioned 2.24.4 Linux package, not a requirement to install the newest
  release.
- FluidR3 GM, by Frank Wen and contributors, provides the sampled piano.
  Its notices are preserved in `THIRD_PARTY_NOTICES.txt`; the SoundFont is a
  build dependency rather than a checked-in binary.
