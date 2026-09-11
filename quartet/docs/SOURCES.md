# Source and adaptation

The thematic source is Hua Yanjun (Abing), *Erquan Yingyue* (*The Moon
Reflected in the Second Spring*), the underlying public-domain melody
specified in the commission. No existing quartet arrangement was used.

The source documentation in the parent repository identifies these references,
which were consulted again for this edition on 11 September 2026:

- [Jiebing Chen, “The Erhu”](https://www.jiebingchen.com/erhu): identifies the
  opening and explains that its degree 6 is E when the tonic is G.
- [Four-bar opening in the complete numbered notation, prepared by Yu Yihui](https://www.qupu123.com/puyou/shangchuan/p357645.html):
  credits Hua Yanjun's performance and Yang Yinliu's notation, with later
  editorial bowing and fingering credits.
- The already documented pitch/rhythm transcription in
  [the repository's original source account](../../docs/SOURCES.md).

The first introductory gesture is shorter than a regular 4/4 bar in the
reference. This fugue makes it a full measure by absorbing the introductory
silence into the first E and sustaining that E for two beats. It then gives
D–E–C–B in eighths. This provides an audible first note at time zero and a
regular four-bar fugal subject. It is an explicit metrical adaptation, not
an assertion of a note-for-note facsimile of the introductory rhythm.

| Subject-I bar | Principal pitch order, ignoring register and repeated notes |
|---:|---|
| 1 | E–D–E–C–B |
| 2 | A–B–G–A |
| 3 | B–D–E–D–E–D–E–G |
| 4 | D–B–D–B–A–E–D–E–G–A |

Bars 2–4 retain the principal source rhythms. Erhu slides, fingerings and
trill embellishments are not transferred literally. The subject begins in
the viola at E4; its answer is a real transposition into the dominant region.
Subject II and all counterpoint, episodic material, harmonic realization,
formal extension, scoring and dynamics are newly composed for this edition.
Minor-region entries are diatonic transformations, identified in the entry
ledger; they are not mislabeled as exact chromatic transpositions.

For the exposition conventions used here, see Mark Gotham's authored
[High Baroque Fugal Exposition](https://viva.pressbooks.pub/openmusictheory/chapter/high-baroque-fugal-exposition/).
A fugue is a compositional practice rather than a fixed universal checklist;
this double fugue uses the design with separate expositions followed by
simultaneous combination. Stretto is not claimed for passages that merely
exchange fragments.

## Rendering dependencies

- [LilyPond 2.24 documentation: creating MIDI output](https://lilypond.org/doc/v2.24/Documentation/notation/creating-midi-output)
- [TinySoundFont](https://github.com/schellingb/TinySoundFont), vendored from
  commit `853a0a171759f1ddba0de1442133a75912bbeffa`, MIT license retained.
- [GeneralUser GS](https://github.com/mrbumpy409/GeneralUser-GS), version 2.0.3,
  commit `684543d5e5efaef08d02be50dcda8d552478fa60`.
  Its license is retained in `GeneralUser-GS-LICENSE.txt`. The SoundFont itself
  is not included. The output validation records the precise soundfont hash.

The source score images are referenced, not redistributed. The newly engraved
quartet pages are generated from this edition's own LilyPond notation.
