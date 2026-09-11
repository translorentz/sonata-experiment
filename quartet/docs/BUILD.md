# Compilation and exact page coordination

`quartet/scripts/build.py` compiles the complete LilyPond file to PDF and
MIDI, validates the compiled music, synthesizes the four instrument tracks,
renders the score to PNG, and encodes the page images with the music.
MP3 and MP4 are local outputs. No audio or video is uploaded by the workflows.

## Common clock

The MIDI is the timing authority. The program integrates every tempo change
with exact rational arithmetic:

```
seconds += delta_ticks * microseconds_per_quarter
           / (ticks_per_quarter * 1_000_000)
```

Every MIDI event is dispatched to the sample renderer at its absolute 48 kHz
sample index. The clocks never accumulate rounded per-note durations. The
quarter note is 0.6 seconds through bar 144, then 0.75 seconds through 150.
The fermata on the last tied whole note is interpreted as the already written
sustained close; no unnotated MIDI delay is guessed or added.

Every page begins on the first note onset of its first bar. The preceding
page remains visible through the release at the end of its last bar. The
cello sustains through the upper strings' breath in bar 48, so that this
page boundary is also an actual note release. There are no fades or lead-in
slates. The last page remains during the three-second release tail.

Each page boundary is exactly representable at both 25 frames per second
and 48,000 samples per second. A boundary that cannot be represented exactly
causes a build failure; the program does not silently round the page turn.
The video is 1080 × 1528, H.264, with 48 kHz stereo AAC. The separately
provided MP3 uses 256 kbit/s encoding. The video uses the lossless intermediate
rendering, rather than cascading MP3 and AAC compression.

## Verification gates

1. LilyPond must compile without musical or engraving warnings, including
   all 600 per-staff bar-number assertions.
2. Every compiled MIDI pitch and duration is compared with the complete
   sixteenth-note event ledger, expanded onto the MIDI tick grid. Ties are
   checked as sounding durations, not as extra attacks.
3. The MIDI must have exactly 150 bars / 600 quarter notes, four monophonic
   tracks and the solo violin, violin, viola and cello instrument programs.
   Each instrument's physical lower range is checked.
4. Both independent expositions and the combined four-voice traversal are
   checked against the subject-entry ledger.
5. The rendered PDF must have the expected 13 pages, with the first measure
   number found in the text of each page. The explicit page breaks and
   page-timing manifest agree.
6. Every page has a real note onset at its start and a real note release at
   the following boundary. Both the frame and sample indices are integral.
7. The encoded video's frame count, audio/video start timestamps, and audio
   duration are checked. The frame immediately before and at every page
   turn is decoded and compared with all original page images.
8. Decoded AAC is compared by waveform correlation with the original
   synthesis near every page onset, independently detecting codec delay.
   The measured lags are included in `validation.json`.
9. The floating-point synthesis is checked for finite, non-silent output;
   it is normalized to -1.2 dBFS before encoding. File and soundfont hashes
   are recorded in the validation report.

The PDF pages also receive visual inspection. `counterpoint-audit.json`
contains musical diagnostics and `docs/FORM.md` explains intentional pedal
and cadential dissonances. These checks do not claim to measure artistic
quality. Natural sample attacks and release envelopes are part of the
instrument sound; synchronization refers to the same scheduled musical
events and rendered audio, not to forcing an artificial instantaneous bow
attack.

## Dependency notes

The vendored TinySoundFont header is compiled into a small local shared
library on the first run. `cc` and `libm` are required. The build uses Python
packages from `quartet/requirements.txt`.

The optional `quartet-toolchain.yml` workflow retrieves the versioned
portable LilyPond 2.24.4 archive, records its SHA-256 and makes a one-day
build artifact. It was used to obtain the engraver for this environment.
The optional quartet check workflow compiles and validates the score; it
does not publish media or alter the repository.

The local `.build/` directory holds the floating-point audio, lossless FLAC,
compiler output and verification frames. These are reproducible intermediates,
not edition deliverables, and are excluded from Git. All edition outputs
except the expressly local MP3 and MP4 are committed.
