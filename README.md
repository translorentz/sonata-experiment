# Sonata experiment — scores and rendering tools

The repository now contains two separate works:

- **[The Two Springs: 150-bar double fugue in G major for string quartet](quartet/README.md)** — the new commission, with a complete LilyPond source, PDF, MIDI, score pages, and a program for exactly synchronized score video. MP3 and MP4 are provided locally.
- **The Second Spring: 200-bar piano sonata**, documented below and preserved unchanged.

---

# The Second Spring

**Sonata in G major, first movement, for solo piano. Exactly 200 bars.**

A new movement by OpenAI / Codex, composed for this repository in 2026,
using the opening of Hua Yanjun (Abing)'s *Erquan Yingyue* as its thematic
source. The music moves from a reflective opening to an Allegro, a lyrical
dominant-key second subject, a turbulent development, and a tonic resolution.

## Finished edition

- [Complete, standalone LilyPond source](score/second-spring.ly)
- [Print-ready A4 score, PDF](output/second-spring.pdf)
- [MIDI performance](output/second-spring.mid)
- [Individual score pages, PNG](output/pages/)
- [Sonata-form requirements and measure-by-measure explanation](docs/FORM.md)
- [Source motif and exact adaptation](docs/SOURCES.md)
- [Page timings](output/page-timing.json) and [build validation](output/validation.json)

The completed MP4 is supplied separately from this repository, as authorized
in the commission. The build program reproduces it in `output/second-spring.mp4`
and also writes an intermediate lossless piano rendering in FLAC format.
These two large generated media files are excluded from version control.

The music lasts **7:15.6**; the video lasts **7:18.6**, including a three-second
release tail. It contains ten score pages at 1080 × 1528, 25 frames/second,
with 48 kHz stereo audio. The audio is a synthesized piano performance.

## Build the entire edition

Requires Python 3.10+, LilyPond 2.24.4 or compatible, FFmpeg/ffprobe, Poppler,
FluidSynth's shared library, and a piano SoundFont. The checked-in edition
was engraved with LilyPond 2.24.4 and rendered with FluidR3 GM.

On Debian/Ubuntu, the system dependencies can be installed with:

```sh
sudo apt-get install lilypond ffmpeg poppler-utils libfluidsynth3 fluid-soundfont-gm python3-venv
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements.txt
python scripts/build.py --soundfont /usr/share/sounds/sf2/FluidR3_GM.sf2
```

For other installations, pass `--lilypond`, `--pdftoppm`, and/or
`--fluid-library` paths. FluidSynth's dependent shared libraries must be on
the platform's normal loader path. No sound card or display is needed.

To compile only the source into PDF and MIDI:

```sh
lilypond -o second-spring score/second-spring.ly
```

The `.ly` file contains every note, articulation, dynamic, tempo, key change,
and page break; it has no external music includes. `scripts/compose.py`
reconstructs that file from the authored bar material and writes its analysis
ledger. **Run it only when regenerating from that material**: it overwrites
edits made directly to the `.ly` file. It does not improvise or randomly
generate notes.

See [build and synchronization details](docs/BUILD.md) for the clocks,
verification procedure, and interpretation of page turns.

## Performance

Keep the right-hand melody above the accompaniment. The separate staff
dynamics deliberately distinguish the two hands. Use light pedal, clearing
at harmony changes; let the imitative bass speak in bars 77–80 and 85–88.
The change at bar 41 broadens the pulse without breaking the long line.
Save the greatest weight for bars 105–108 and the final cadence. No written
exposition repeat is used; the performed traversal is 200 bars.

The borrowed material, new composition, and rendering dependencies are
identified in [sources](docs/SOURCES.md) and
[third-party notices](docs/THIRD_PARTY_NOTICES.txt).
