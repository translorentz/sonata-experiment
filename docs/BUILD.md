# Reproducible build and synchronization

`scripts/build.py` compiles the complete LilyPond source, reads its actual
MIDI tempo map, synthesizes the MIDI through FluidSynth, renders the PDF to
PNG, and encodes the page images and piano audio into an H.264/AAC MP4.
The final PDF, MIDI, page PNGs, timing JSON, and validation JSON are committed.
The completed MP4 is supplied separately, following permission to omit video
from the push. The generated MP4 and intermediate FLAC are excluded from
version control, along with temporary WAV, logs, and validation frames.

## One source for music; explicit layout boundaries

`score/second-spring.ly` is independently compilable. Its music has
`\barNumberCheck` assertions for both hands at every measure. Its layout
stream places four measures on each system and twenty measures on each page.
`score/structure.json` states these same page boundaries. `compose.py`
produces both from the same authored bar list; the build additionally checks
the rendered page count and the compiled MIDI's length.

If editing the `.ly` directly, keep the structure manifest's page starts and
bar count consistent. If new tempos place a page turn between video frames,
the build fails instead of silently rounding it.

## Timing contract

The build integrates every MIDI delta tick using exact rational arithmetic:

```
elapsed_seconds = delta_ticks * microseconds_per_quarter
                  / (ticks_per_quarter * 1_000_000)
```

Every tempo change takes effect at its MIDI tick. Every synthesis event is
scheduled at its absolute 48 kHz sample index. Accumulating absolute sample
targets prevents per-note rounding drift. No live playback clock is used.

Each page is shown from the first onset in its first bar through the end of
its last notated bar, and changes at the first onset on the next page.
The build checks that both hands together provide an onset at every page
start. Rests remain part of their notated page. A final note's **duration**
is retained; a page does not turn prematurely on that note's attack.

For this edition, every page boundary is exactly representable on both the
25 fps video clock and the 48 kHz sample clock: no frame rounding is needed.
The PNG for the next page first occurs on that exact frame. There are no
fades, scrolls, lead-in slates, or added pauses. The final page remains during
a three-second release/reverberation tail after bar 200.

“Exact” describes the MIDI event/sample and video-frame scheduling. Natural
sample attacks and piano decay remain part of the instrument sound. The
MP4 uses AAC; its codec priming is represented by container timestamps, and
the verified audio and video streams both begin at time zero. The FLAC is
also generated as the lossless intermediate rendering.

## Verification performed by the program

- Rejects musical/engraving warnings and failed LilyPond compilation.
- Checks 200 complete measures / 800 quarter notes in the actual MIDI.
- Independently checks the opening melody pitches and 88-key piano range.
- Checks the secondary theme's register and its cadence soprano pitches,
  and requires every simultaneous hand position to span at most an octave.
- Requires a note onset at each page start.
- Requires integer audio sample indices for all MIDI events.
- Requires integer frame/sample indices for every page boundary.
- Checks the final PDF and rendered image page counts.
- Checks video frame count, stream start times, and audio duration.
- Decodes the frame immediately before and at **every** page change and
  identifies the correct page by image comparison against all page PNGs.
- Rejects silent or clipped synthesis output and records the applied gain.
- Writes hashes of all final artifacts and the selected SoundFont.

The final edition is also visually inspected for page layout, music spacing,
legibility, and score markings. The machine-readable evidence is in
`output/validation.json`; exact page intervals are in
`output/page-timing.json`.

## Useful commands

```sh
# Reconstruct the authored edition and its manifest.
python scripts/compose.py

# Build and verify every deliverable.
python scripts/build.py --soundfont /usr/share/sounds/sf2/FluidR3_GM.sf2

# Supply locally installed tool paths if necessary.
python scripts/build.py --lilypond /path/to/lilypond \
  --pdftoppm /path/to/pdftoppm \
  --fluid-library /path/to/libfluidsynth.so.3 \
  --soundfont /path/to/FluidR3_GM.sf2
```

Engraving geometry or encoded bytes may differ with different LilyPond,
font, Poppler, FFmpeg, or FluidSynth versions. A different SoundFont changes
the timbre. The MIDI-derived timing contract is checked on every build.
