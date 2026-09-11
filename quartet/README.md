# The Two Springs

**Double fugue in G major for string quartet — 150 bars.**

A new composition on the four-bar opening of Hua Yanjun (Abing)'s
*Erquan Yingyue*, with a separately exposed second subject, a combined
exposition, related-key development, rhythmic augmentation over a dominant
pedal, and a tonic conclusion. The existing piano sonata in the parent
repository is preserved as a separate work.

## Edition

- [Complete, standalone LilyPond score](score/two-springs.ly)
- [Engraved conductor's score, PDF](output/two-springs.pdf)
- [Four-track MIDI](output/two-springs.mid)
- [13 score-page images](output/pages/)
- [Formal account and entry table](docs/FORM.md)
- [Source attribution and adaptation](docs/SOURCES.md)
- [Build and synchronization details](docs/BUILD.md)
- [Timing manifest](output/page-timing.json), [technical validation](output/validation.json), and [counterpoint diagnostics](output/counterpoint-audit.json)

The MP3 and H.264/AAC MP4 are supplied locally and excluded from Git. A full
build creates them at `output/two-springs.mp3` and `output/two-springs.mp4`.
The performance lasts **6:03.6**; the video lasts **6:06.6**, including a
three-second release tail. The audio is a sampled performance, not a live
quartet recording.

## Reproduce

Dependencies: Python 3.10+, a C compiler, LilyPond 2.24.4 or compatible,
FFmpeg/ffprobe, Poppler, and a General MIDI SoundFont with violin, viola and
cello presets. The edition uses GeneralUser GS 2.0.3. The small MIT-licensed
TinySoundFont renderer is included in `vendor/`; the SoundFont is an external
build dependency.

```sh
# Debian/Ubuntu system prerequisites:
sudo apt-get install lilypond ffmpeg poppler-utils build-essential python3-venv
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -r quartet/requirements.txt

# Compile, synthesize, encode, and verify:
python quartet/scripts/build.py --soundfont /path/to/GeneralUser-GS.sf2

# Engraving and MIDI only:
python quartet/scripts/build.py --engrave-only

# Alternatively, compile the complete .ly directly:
lilypond -o two-springs quartet/score/two-springs.ly
```

Use `--lilypond /path/to/lilypond` and `--pdftoppm /path/to/pdftoppm` when the
programs are outside PATH. Download the soundfont from the
[GeneralUser GS project](https://www.schristiancollins.com/generaluser).

`compose.py` reconstructs the published note data and LilyPond file from the
specified subjects, entry plan, episode lines, cadences, and a deterministic
voice-leading realization of the supporting parts. It overwrites direct
edits to the `.ly` and `events.json`; it is not run by `build.py`.
The published `.ly` contains every note and needs no music includes.

```sh
python quartet/scripts/compose.py
python quartet/scripts/audit.py --check
python -m unittest discover -s quartet/tests
```

## Performance

Keep the sigh supple, with the short notes gathered into one bow whenever
practical. Let the active subject emerge from the other lines; the small
Roman numerals identify its entrances. Subject II should have a lighter,
more forward character, with clear but unforced eighths. Reserve the fullest
sound for the combined entries at 81 and the tonic group at 129. Sustain the
cello pedal through 121–128, renewing the bow unobtrusively at bar lines.
The augmentation above it should carry one long phrase. Broaden at 145;
the final tied tonic spans both 149 and 150.

The formal and synchronization claims are testable. Counterpoint diagnostics
are review aids, not an aesthetic grade or proof of equality with Bach.
