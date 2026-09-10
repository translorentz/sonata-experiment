#!/usr/bin/env python3
"""Assemble the authored musical material into a standalone LilyPond score.

There is no random music generation. Each melodic bar and its harmony is
specified below; named accompaniment patterns implement pianistic voicings.
The checked-in .ly is the complete, independently compilable edition.
"""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[1]
BARS = []

# Absolute pitches; middle C is c'. Broken figures stay within a playable
# rolling hand position. Roman numerals are documented in docs/FORM.md.
HARMONIES = {
    'G': 'g, d g b', 'G/B': 'b, d g b', 'G/D': 'd a d\' g\'',
    'C': 'c g c\' e\'', 'C/E': 'e g c\' e\'',
    'Am': 'a, e a c\'', 'Am/C': 'c e a c\'',
    'D': 'd a d\' fis\'', 'D/F#': 'fis, a d fis',
    'D7': 'd a c\' fis\'', 'D7/C': 'c a d\' fis\'',
    'Em': 'e b e\' g\'', 'Em/B': 'b, e g b',
    'B7': 'b, fis a dis\'', 'Bm': 'b, fis b d\'',
    'A': 'a, e a cis\'', 'A7': 'a, e g cis\'',
    'A/C#': 'cis e a cis\'', 'D/A': 'a, d fis a',
    'F#m': 'fis, cis fis a', 'F#7': 'fis, cis e ais',
    'Bm/D': 'd fis b d\'', 'E7': 'e b d\' gis\'',
    'Cmaj7': 'c g b e\'', 'F': 'f c\' f\' a\'',
    'Dm': 'd a d\' f\'', 'G7': 'g, d f b',
    'Cm': 'c g c\' ees\'', 'Ab': 'aes, ees aes c\'',
    'Bb': 'bes, f bes d\'', 'Eb': 'ees bes ees\' g\'',
    'Gm': 'g, d g bes', 'Edim': 'e bes e\' g\'',
    'A7b9': 'a, g bes cis\'', 'D7b9': 'd a c\' ees\'',
    'Ger6': 'ees bes cis\' g\'',
}

def accompaniment(chord, texture='flow'):
    p = HARMONIES[chord].split()
    a, b, c, d = p
    if texture == 'flow':
        return f'{a}8( {b} {c} {d} {c} {b} {c} {b})'
    if texture == 'alberti':
        return f'{a}8( {d} {b} {d} {c} {d} {b} {d})'
    if texture == 'pulse':
        return f'{a}4 <{b} {c} {d}>8-. <{b} {c} {d}>-. {a}4 <{b} {c} {d}>4-.'
    if texture == 'quiet':
        return f'<{a} {b}>2 <{c} {d}>2'
    if texture == 'bass':
        return f'{a}2 <{b} {c} {d}>4 <{b} {c} {d}>4'
    if texture == 'tremolo':
        return f'{a}8 <{b} {c} {d}> {a} <{b} {c} {d}> {a} <{b} {c} {d}> {a} <{b} {c} {d}>'
    raise ValueError(texture)

def phrase(section, melodies, chords, texture='flow', trans=None):
    melodies = [s.strip() for s in melodies.split('|') if s.strip()]
    chords = chords.split()
    assert len(melodies) == len(chords), (section, len(melodies), len(chords))
    for melody, chord in zip(melodies, chords):
        BARS.append(dict(bar=len(BARS)+1, section=section, rh=melody,
                         lh=accompaniment(chord, texture), harmony=chord,
                         transpose=trans))

# 1-8: pitch-faithful four-bar incipit, metrically enlarged at m.1;
# an original consequent reaches a root-position G-major cadence.
phrase('P', r'''
r4. e8( d e c b) |
a2 a8.( b16) g8( g16 a) |
b4.( d8) e8( d) e16( d e g) |
d8.( b16) d8( d16 b) a8( e') d16( e g a) |
g4( fis8 e) d4( b8 a) |
g8( a b c) d4( e8 c) |
b4( a) g8( e' d c) |
b4( a8 fis) g2 |
''', 'G D7 G D7 Em C D7 G', 'quiet')

# 9-16: the sigh becomes an upbeat Allegro theme, with a half cadence.
phrase('P', r'''
e8( d e c) b4( d8 g) |
fis8( e fis d) c4( a8 d) |
b8( d g fis) e( d c b) |
a4( b8 c) d2 |
e8( d e c) b( c d e) |
fis8( e fis d) c( b a g) |
a8( b c d) e4( cis8 a) |
<a d fis>2 r4 d8( c) |
''', 'G D7 G D C D/F# A7 D', 'alberti')

# 17-24: expanded continuation and definitive tonic PAC.
phrase('P', r'''
b8( d g a) b4( a8 g) |
a8( fis d c) b4( a) |
g8( b e fis) g4( fis8 e) |
fis8( dis b a) g4( fis) |
e8( g c d) e4( d8 c) |
b8( a g fis) e4( c') |
b4( a8 g) fis8( e d fis) |
<g b g'>2 r2 |
''', 'G D/F# Em B7 C Am/C D7 G', 'flow')

# 25-40: TR uses diminution, sequential ascent, then an A dominant lock.
phrase('TR', r'''
e16( d e c b c d e) g8-. g-. fis-. e-. |
fis16( e fis d c d e fis) a8-. a-. g-. fis-. |
g16( fis g e d e fis g) b8-. b-. a-. g-. |
ais8( b cis b) ais4( fis) |
b16( a b g fis g a b) d8-. cis-. b-. a-. |
gis8( a b a) gis4( e) |
a16( g a fis e fis g a) cis8-. b-. a-. g-. |
fis4( e8 cis) d4 r4 |
fis8( e fis d) cis8( e a g) |
fis8( a d cis) b4( a8 g) |
fis8( e d fis) e4( d8 b) |
cis8( b a cis) e4( g8 e) |
<a, cis e>4-> r8 e'8 <a, cis e>4-> r8 e'8 |
g8( fis e d) cis4( b8 a) |
<a cis e>4 <b d e> <cis e a> <b d gis> |
<cis e a>2 r2 |
''', 'Em D/F# G F#7 Bm E7 A D A/C# D Bm A7 A7 A7 A7 A', 'pulse')

# 41-64: S, lyrical and spacious in D. Its falling seconds are transformed
# sighs; the deceptive arrival at 56 delays essential closure until 64.
phrase('S', r'''
fis'2( e4 d) |
e4.( fis8) cis2 |
d4( fis8 a) g4( fis8 e) |
fis2( e4) r4 |
g4.( fis8) e4( d) |
cis8( d e fis) g4( e) |
fis4( e8 d) cis4( b8 cis) |
fis'2. r4 |
''', 'D A/C# Bm F#m G Em A7 D', 'flow')
phrase('S', r'''
a'2( g4 fis) |
g4.( a8) e2 |
fis8( e d fis) b4( a8 g) |
a4( fis8 d) cis2 |
b8( cis d e) fis4( g8 fis) |
e4( g8 fis) e4( d8 b) |
cis4( d8 e) <g, cis e>4( <a cis e>) |
<b d fis>2 r4 fis'8( e) |
''', 'D A/C# Bm D/A G Em A7 Bm', 'flow')
phrase('S', r'''
d4( cis8 b) a4( fis8 d) |
e8( fis g a) b4( g8 e) |
fis4( g8 a) d4( cis8 b) |
a8( g fis e) d4( fis8 a) |
b4( a8 g) fis4( e8 d) |
e4( fis8 g) <g b e>2 |
<fis a d>2 <e g cis>4( <e g a>) |
<fis a d>1 |
''', 'Bm Em D F#m G Em A7 D', 'flow')

# 65-72: closing group; unequivocal D-major cadence and a quiet seam.
phrase('C', r'''
d8-. fis-. a-. d-. cis( b a g) |
fis8( e fis d) cis4( a) |
b8-. d-. g-. b-. a( g fis e) |
<e g a>2 <cis e a>2 |
fis8( e fis d) a4( cis8 e) |
d8( cis d b) a4( fis) |
<g a cis>2 <e g a>2 |
<fis a d>2 r2 |
''', 'D A7 G A7 D D/A A7 D', 'pulse')

# 73-88: development begins in B minor. The head is passed into the bass
# in 77-80 and 85-88 while the treble supplies an independent countersubject.
phrase('DEV', r'''
g'8( fis g e) d4( fis8 b) |
ais8( gis ais fis) e4( cis8 ais) |
b8( cis d e) fis4( e8 d) |
cis4( b8 ais) b4 r4 |
fis'4( e8 d) cis4( d8 e) |
dis4( fis8 a) g4( fis8 e) |
e4( fis8 g) a4( g8 fis) |
fis4( e8 dis) e2 |
c'8( b c a) g4( b8 e) |
dis8( cis dis b) a4( fis8 dis) |
e8( fis g a) b4( a8 g) |
fis4( e8 dis) e4 r4 |
b'4( a8 g) fis4( g8 a) |
gis4( b8 d) c4( b8 a) |
a4( b8 c) d4( c8 b) |
b4( a8 gis) a2 |
''', 'Bm F#7 Bm F#7 Bm B7 Em B7 Em B7 Em B7 Em E7 Am E7', 'alberti')

# 89-104: inversion (ascending contour), sequence, harmonic darkening.
phrase('DEV', r'''
a8( b a c) d4( c8 b) |
c8( d c e) f4( e8 d) |
b8( c b d) e4( d8 c) |
c8( d c e) f4( e8 d) |
d16( e f g a g f e) d8( a' f d) |
e16( fis g a b a g fis) e8( b' g e) |
f16( g a bes c bes a g) f8( c' a f) |
g8( f ees d) c4( bes8 aes) |
g8( aes bes c) ees4( d8 c) |
bes8( c d ees) f4( ees8 d) |
c8( d ees f) g4( f8 ees) |
d4( ees8 f) bes4( aes8 g) |
ees8( f g aes) bes4( aes8 g) |
fis16( g a bes c bes a g) fis8( d fis a) |
bes8( a g fis) g4( bes8 d) |
<ees, g bes>4-> <e g bes>4-> <cis e g bes>2-> |
''', 'Am F G7 C Dm Em F Cm Ab Bb Cm Bb Eb D7 Gm A7b9', 'flow')

# 105-120: developmental climax, liquidation, German-sixth resolution,
# then a twelve-bar dominant preparation, the last eight over a D pedal.
phrase('RT', r'''
<e g bes cis>4-> <e g bes cis>8-. <e g bes cis>-. <e g bes cis>4-> r4 |
<ees g bes cis>2-> <ees g bes cis>4 r4 |
<d g b>2 <cis e g>2 |
<c fis a>2 r4 a'8( g) |
fis8( e fis d) c4( a) |
g'8( fis g e) d4( b) |
fis'8( e fis d) c4( a) |
e'8( d e c) b4( g) |
fis'4( e) d( c) |
b4( a) g( fis) |
e'4( d) c( b) |
a4( g) fis( e) |
d8( e fis g) a4( c) |
b8( a g fis) e4( cis') |
d4( c8 a) fis4( e8 c) |
a2 r2 |
''', 'A7b9 Ger6 G/D D7 D7 G/D D7 G/D D7 G/D D7 D7 D7 A7 D7 D7', 'tremolo')

# 121-144: return of P. The primary theme's formal identity is preserved,
# while its once static opening now has flowing accompaniment.
for original in BARS[:24]:
    b = dict(original)
    b.update(bar=len(BARS)+1, section='RECAP-P')
    if original['bar'] <= 8:
        b['lh'] = accompaniment(b['harmony'], 'flow')
    BARS.append(b)

# 145-160: recomposed transition, resisting the exposition's D-major exit.
phrase('RECAP-TR', r'''
e16( d e c b c d e) g8-. g-. fis-. e-. |
d16( c d b a b c d) fis8-. fis-. e-. d-. |
c16( b c a g a b c) e8-. e-. d-. c-. |
dis8( e fis e) dis4( b) |
e16( d e c b c d e) g8-. fis-. e-. d-. |
cis8( d e d) cis4( a) |
d16( c d b a b c d) fis8-. e-. d-. c-. |
b4( a8 fis) g4 r4 |
b8( a b g) fis( a d c) |
b8( d g fis) e4( d8 c) |
b8( a g b) a4( g8 e) |
fis8( e d fis) a4( c8 a) |
<a c d>4-> r8 a8 <a c d>4-> r8 a8 |
c8( b a g) fis4( e8 d) |
<fis a d>4 <g b d> <a c fis> <g c e> |
<fis a d>2 r2 |
''', 'G D/F# Am B7 Em A7 D G D/F# G Em D7 D7 D7 D7 D', 'pulse')

# 161-184: S transposed down a fifth, including its delayed cadence.
for original in BARS[40:64]:
    b = dict(original)
    b.update(bar=len(BARS)+1, section='RECAP-S', transpose=('d\'', 'g'))
    BARS.append(b)

# 185-192: closing group now in G, completing the tonal resolution.
for original in BARS[64:72]:
    b = dict(original)
    b.update(bar=len(BARS)+1, section='RECAP-C', transpose=('d\'', 'g'))
    BARS.append(b)

# 193-200: coda recalls the sigh, borrows iv once, and answers it in G.
phrase('CODA', r'''
e8( d e c) b4( d8 g) |
ees8( d ees c) bes4( g) |
b8( a g b) d4( g8 fis) |
e4( d8 c) a2 |
<b d g>2 <c e g>2 |
<b d g>2 <a c fis>2 |
<g b g'>2 <fis a d fis>2 |
<g b d g>1 |
''', 'G Cm G/B Am/C C D7 D7 G', 'quiet')

# Hand-authored bass imitations; the upper voice remains a counter-melody.
for bar, notes in {
    77: "g8( fis g e) d4( fis8 b)",
    78: "a8( fis a fis) dis4( b,)",
    79: "c'8( b c a) g4( b8 e')",
    80: "fis8( e dis cis) b2",
    85: "c'8( b c' a) g4( b8 e')",
    86: "d'8( b d' b) gis4( e)",
    87: "f'8( e' f' d') c'4( e'8 a')",
    88: "b8( a gis fis) e2",
}.items():
    BARS[bar-1]['lh'] = notes

# Cadences use root-position basses and upper tonic scale-degree 1.
for bar, notes in {
    8: "d4 <a c' fis'> g,2",
    24: "<g, d g>2 r2",
    40: "<a, e a>2 r2",
    64: "<d a d'>1",
    72: "<d a d'>2 r2",
    128: "d4 <a c' fis'> g,2",
    144: "<g, d g>2 r2",
    160: "<d a d'>2 r2",
    184: "<d a d'>1",  # transposed with the S group
    192: "<d a d'>2 r2",  # transposed with the closing group
    195: "b,8( d g b d' b g d)",
    196: "c8( e a c' e' c' a e)",
    197: "g,2 c2",
    198: "d2 d2",
    199: "g,2 d2",
    200: "<g, d g>1",
}.items():
    BARS[bar-1]['lh'] = notes

# D pedal is explicit, not inferred from a chord label.
for bar in range(113, 121):
    chord = '<fis a c\'>' if bar % 2 else '<g b d\'>'
    if bar >= 117:
        chord = '<fis a c\'>'
    BARS[bar-1]['lh'] = f'd8 {chord} d {chord} d {chord} d {chord}'
BARS[119]['lh'] = 'd2 <d fis a c\'>2'

# Register editing is explicit because each relative bar has its own anchor.
# Carry sequences into the next bar's register; keep S singing around F#5
# (B4 in the recap), and let the closing response settle an octave lower.
REGISTER_EDITS = {
    5:1, 18:1, 21:-1, 37:1, 38:1, 41:-1, 45:1, 48:-1, 50:1, 52:1, 57:1, 60:1, 61:1,
    72:-1, 74:1, 77:-1, 82:1, 86:1, 87:1, 88:1, 96:1, 103:1,
    104:1, 111:-1, 112:-1, 113:-1, 115:-1, 117:-1, 125:1, 138:1, 141:-1, 156:-1, 159:-1, 160:-1,
    161:-1, 165:1, 168:-1, 170:1, 172:1, 177:1, 180:1, 181:1, 192:-1,
}
for bar, octaves in REGISTER_EDITS.items():
    BARS[bar-1]['rh_octaves'] = octaves
BARS[118]['rh'] = "d4( c8 a) fis'4( e8 c)"

DYNAMICS = {1:'p',3:'mp',5:'mp',9:'mf',17:'f',24:'p',25:'mf',29:'f',
    33:'f',37:'ff',40:'p',41:'p',49:'mp',53:'mf',56:'p',57:'mp',61:'f',
    64:'mf',65:'f',69:'mp',72:'p',73:'p',77:'mp',81:'mf',85:'f',89:'p',
    93:'mf',97:'f',101:'ff',105:'ff',109:'f',113:'mp',117:'p',120:'pp',
    121:'mp',125:'mf',129:'f',137:'ff',144:'p',145:'mf',149:'f',153:'f',
    157:'ff',160:'p',161:'p',169:'mp',173:'mf',176:'p',177:'mp',181:'f',
    184:'f',185:'f',189:'mp',192:'p',193:'p',194:'pp',195:'mp',197:'f',199:'ff',200:'ff'}
HAIRPINS = {1:r'\<',3:r'\!',9:r'\<',17:r'\!',21:r'\>',24:r'\!',
    25:r'\<',29:r'\!',33:r'\<',37:r'\!',41:r'\<',45:r'\>',48:r'\!',
    49:r'\<',53:r'\!',57:r'\<',61:r'\!',69:r'\>',72:r'\!',73:r'\<',
    77:r'\!',81:r'\<',85:r'\!',89:r'\<',97:r'\!',101:r'\<',105:r'\!',
    109:r'\>',120:r'\!',121:r'\<',125:r'\!',129:r'\<',137:r'\!',
    141:r'\>',144:r'\!',145:r'\<',149:r'\!',153:r'\<',157:r'\!',
    161:r'\<',165:r'\>',168:r'\!',169:r'\<',173:r'\!',177:r'\<',
    181:r'\!',189:r'\>',192:r'\!',195:r'\<',199:r'\!'}
TEMPOS = {1:(80,'Andante, quasi una memoria'),5:(120,'Allegro moderato'),
    41:(100,'Cantabile, poco meno mosso'),65:(120,'Tempo I'),
    73:(120,'Agitato'),105:(120,'Con fuoco'),113:(100,'Poco a poco tranquillo'),
    117:(80,'Meno mosso'),120:(60,'Sospeso'),121:(120,'Tempo I, dolce'),
    161:(100,'Cantabile'),185:(120,'Tempo I'),193:(80,'La memoria'),
    195:(100,'Animando'),197:(120,'Risoluto'),199:(80,'Allargando'),200:(60,'Largo')}
MARKS = {1:'P · Exposition',25:'TR',41:'S · D major',65:'Closing',
    73:'Development',89:'Inversion',105:'Retransition',121:'Recapitulation',
    145:'TR · recomposed',161:'S · G major',185:'Closing',193:'Coda'}
KEYS = {1:('g','major'),41:('d','major'),73:('b','minor'),81:('e','minor'),
        89:('a','minor'),97:('c','minor'),105:('g','major'),161:('g','major')}

assert len(BARS) == 200

def main():
    # Twenty bars/page, four bars/system, ten pages. Exposition S and both
    # recapitulation themes begin pages. Layout and timing share boundaries.
    pages = [{'page':i+1, 'first_bar':s, 'last_bar':min(s+19,200)}
             for i,s in enumerate(range(1,201,20))]
    header = r'''\version "2.24.4"
\pointAndClickOff
#(set-global-staff-size 18)
#(ly:set-option 'midi-extension "mid")
\header {
  title = "The Second Spring"
  subtitle = "Sonata in G major · I"
  subsubtitle = "On the opening of Erquan Yingyue · 200 measures"
  composer = "New movement: OpenAI / Codex (2026)"
  poet = "Source motif: Hua Yanjun (Abing)"
  tagline = ##f
}
\paper {
  #(set-paper-size "a4")
  top-margin = 12\mm
  bottom-margin = 12\mm
  left-margin = 15\mm
  right-margin = 15\mm
  print-page-number = ##t
  ragged-last-bottom = ##f
  system-system-spacing.basic-distance = #20
  system-system-spacing.minimum-distance = #12
  score-system-spacing.basic-distance = #18
  oddFooterMarkup = \markup \fill-line { \tiny "The Second Spring · I" \fromproperty #'page:page-number-string }
  evenFooterMarkup = \oddFooterMarkup
}
global = {
  \numericTimeSignature \time 4/4
  \accidentalStyle piano
'''
    glob = []
    timing = []
    for b in BARS:
        n = b['bar']
        line = [f'  % m. {n}']
        if n in KEYS:
            key, mode = KEYS[n]
            line.append(f'  \\key {key} \\{mode}')
        line.append('  s1 |')
        glob.extend(line)
        parts = [f'  \\barNumberCheck #{n}']
        if n in MARKS:
            parts.append(f'\\mark \\markup \\box \\small "{MARKS[n]}"')
        if n in TEMPOS:
            bpm, label = TEMPOS[n]
            parts.append(f'\\tempo "{label}" 4 = {bpm}')
        parts.append('s1 |')
        if n % 20 == 0:
            parts.append(r'\pageBreak')
        elif n % 4 == 0:
            parts.append(r'\break')
        else:
            parts.append(r'\noBreak')
        timing.append(' '.join(parts))

    music = []
    for hand in ['rh','lh']:
        music.append(hand + ' = {')
        for b in BARS:
            n = b['bar']
            source = b[hand]
            if hand == 'rh':
                expr = f"\\relative c'' {{ {source} }}"
                if b.get('rh_octaves'):
                    destination = "c'" if b['rh_octaves'] == 1 else 'c,'
                    expr = f'\\transpose c {destination} {{ {expr} }}'
            else:
                expr = f'\\absolute {{ {source} }}'
            if b['transpose']:
                a,z = b['transpose']
                expr = f'\\transpose {a} {z} {{ {expr} }}'
            # Dynamics are a simultaneous skip voice to avoid altering note
            # spelling, relative pitch, or slur attachment.
            dyn = ('\\'+DYNAMICS[n]) if n in DYNAMICS else ''
            if hand == 'lh':
                dyn = {'ff':r'\f','f':r'\mf','mf':r'\mp','mp':r'\p','p':r'\pp','pp':r'\ppp'}.get(DYNAMICS.get(n,''),'')
            hairpin = HAIRPINS.get(n,'')
            extra = ''
            if hand == 'rh' and n == 1:
                extra = r'^\markup \italic "Singing tone; light pedal, clear at each harmony"'
            if hand == 'rh' and n == 77:
                extra = r'^\markup \italic "Bass cantabile"'
            if hand == 'rh' and n == 87:
                extra = r'^\markup \italic "l.h. may take the inner notes"'
            if hand == 'lh' and n == 77:
                dyn = r'\mf'
            if hand == 'lh' and n == 85:
                dyn = r'\f'
            music.append(f'  % m. {n}: {b["section"]}; {b["harmony"]}' + (' (transposed)' if b['transpose'] else ''))
            music.append(f'  \\barNumberCheck #{n} << {{ {expr} }} {{ s1{dyn}{hairpin}{extra} }} >> |')
        music.append(r'  \bar "|."' + '\n}')

    tail = r'''
\score {
  \new PianoStaff \with { instrumentName = "Piano" } <<
    \new Staff = "upper" \with { midiInstrument = "acoustic grand" } <<
      \global \new Voice { \rh } \new NullVoice { \timing }
    >>
    \new Staff = "lower" \with { midiInstrument = "acoustic grand" } <<
      \clef bass \global \new Voice { \lh }
    >>
  >>
  \layout {
    \context { \Score
      autoBeaming = ##t
      \override BarNumber.break-visibility = ##(#f #f #t)
      \override RehearsalMark.self-alignment-X = #LEFT
      \override MetronomeMark.font-size = #-1
    }
  }
  \midi { }
}
'''
    text = header + '\n'.join(glob) + '\n}\ntiming = {\n' + '\n'.join(timing) + '\n}\n' + '\n'.join(music) + tail
    (ROOT/'score/second-spring.ly').write_text(text)
    manifest = {'title':'The Second Spring', 'bars':200, 'beats_per_bar':4,
                'pages':pages, 'tempos':[{ 'bar':bar, 'bpm':v[0], 'label':v[1] } for bar,v in TEMPOS.items()],
                'sections':[{ 'bar':bar, 'label':label } for bar,label in MARKS.items()]}
    (ROOT/'score/structure.json').write_text(json.dumps(manifest, indent=2)+'\n')
    (ROOT/'score/composition.json').write_text(json.dumps(BARS, indent=2)+'\n')
    print(f'Wrote standalone LilyPond: {len(BARS)} bars; {len(pages)} pages.')

if __name__ == '__main__':
    main()
