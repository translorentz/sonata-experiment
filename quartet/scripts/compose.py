#!/usr/bin/env python3
"""Rebuild the fully specified quartet edition and its analytical ledger.

The two subjects, entry order, tonal itinerary, episode themes and cadences
are authored below. A constrained beam search realizes the free
quarter-note skeleton; restrained passing notes elaborate it. The result
is frozen in score/events.json and the standalone .ly for editing.
No random generation and no external music files are used.
"""
from __future__ import annotations
import itertools
import json
from pathlib import Path
import re
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
N = 150
SCALE = [0,2,4,5,7,9,11]
NAMES = ['c','cis','d','dis','e','f','fis','g','gis','a','bes','b']
RANGES = [(62,88),(55,81),(48,76),(36,67)]
CENTERS = [77,70,61,48]
VOICES = ['violinOne','violinTwo','viola','cello']
LABELS = ['Violin I','Violin II','Viola','Violoncello']
FIXED = [[None]*(16*N) for _ in range(4)]
FSTART = [set() for _ in range(4)]
AUTHOR = [[] for _ in range(4)]
ENTRIES = []
KEYS = [(7,False)]*N
HARM = [[0,0,4,0] for _ in range(N)]
DYNAMICS = {1:'mp',13:'mf',17:'mp',25:'mf',41:'p',49:'mp',61:'mf',65:'mp',73:'mf',81:'f',97:'mp',105:'mf',117:'f',121:'p',129:'f',145:'mf',149:'p'}
SECTIONS = {1:'I. The sigh',17:'First episode',25:'Wandering entries',41:'Threshold',49:'II. The answering current',65:'Second episode',73:'Subject II: return',81:'III. Confluence',97:'Sequence',105:'Shadows',121:'Dominant preparation',129:'IV. The spring returns',145:'Coda'}

def parse(text):
    result=[]
    for token in text.replace('|',' ').split():
        m=re.fullmatch(r"(r|[a-g](?:is|es)?)([',]*)(\d+)(\.?)(~?)",token)
        if not m: raise ValueError(token)
        name,octs,den,dot,tie=m.groups()
        dur=16//int(den)
        if dot: dur=dur*3//2
        if name=='r': pitch=-1
        else:
            pc={'c':0,'d':2,'e':4,'f':5,'g':7,'a':9,'b':11}[name[0]]
            pc += 1 if name.endswith('is') else -1 if name.endswith('es') else 0
            pitch=48+pc+12*(octs.count("'")-octs.count(','))
        result.append((pitch,dur))
    return result

# The opening introductory bar is metrically expanded: E is sustained for
# two beats; the original E-D-E-C-B pitch sequence and the next three bars'
# principal pitches/rhythms are retained. Register here begins at E4.
A = parse("e'2 d'8 e'8 c'8 b8 | a2 a8. b16 g8 g16 a16 | b4. d'8 e'8 d'8 e'16 d'16 e'16 g'16 | d'8. b16 d'8 d'16 b16 a8 e'8 d'16 e'16 g'16 a'16")
# A distinct four-bar subject, designed against the first in both registers.
# Its final rising fourth echoes the opening and supports I's final E-G-A
# ornament when II is the bass. Both expositions use this revised form.
B = parse("g'4 c''8 g'8 fis'4 a'4 | c''8 b'8 c''8 a'8 c''4 e'8 fis'8 | g'8 fis'8 g'8 b'8 c''4 g'4 | b'8 a'8 b'8 g'8 fis'4 b'16 e''8.")
assert sum(d for _,d in A)==sum(d for _,d in B)==64

# Scale transform: original G major -> requested major or relative minor.
def transform(p,key=7,minor=False,octave=0):
    if p<0:return p
    degree_oct,pc=divmod(p-55,12)  # G3 reference
    degree=[0,2,4,5,7,9,11].index(pc)
    target=[0,2,3,5,7,8,10] if minor else SCALE
    return 48+key+12*degree_oct+target[degree]+12*octave

def install(voice,bar,material,key=7,minor=False,octave=0,label=None):
    start=(bar-1)*16
    t=start
    notes=[]
    for p,d in material:
        p=transform(p,key,minor,octave)
        if any(x is not None for x in FIXED[voice][t:t+d]):
            raise ValueError(('overlapping authored notes',voice,bar,t))
        FIXED[voice][t:t+d]=[p]*d
        FSTART[voice].add(t)
        notes.append(dict(t=t,p=p,d=d,kind=label or 'episode'))
        t+=d
    AUTHOR[voice].extend(notes)
    if label: ENTRIES.append(dict(subject=label,voice=LABELS[voice],voice_id=voice,bar=bar,key=key,minor=minor,octave=octave,length_bars=(t-start)/16))

def silence(v,first,last):
    for b in range(first,last+1): install(v,b,[(-1,16)])

def region(first,last,key,minor=False):
    for b in range(first,last+1):KEYS[b-1]=(key,minor)

def entry(v,bar,subject,key=7,minor=False,octave=0):
    install(v,bar,A if subject=='I' else B,key,minor,octave,subject)
    # Roman degrees are zero-based in the local key.
    harmonies=[[5,3,4,1],[1,1,1,3],[0,0,3,5],[0,0,4,0]]
    for i,h in enumerate(harmonies):HARM[bar-1+i]=h

# First exposition: alto, soprano II, soprano I, bass; tonic/dominant.
silence(0,1,8);silence(1,1,4);silence(3,1,12)
entry(2,1,'I');entry(1,5,'I',2,octave=1);entry(0,9,'I',octave=1);entry(3,13,'I',2)
region(5,8,2);region(13,16,2)

# Middle entries move through related regions and redistribute the subject.
for args in [(0,25,4,True,1),(2,29,9,True,0),(1,33,0,False,1),(3,37,7,False,-1)]:
    v,b,k,m,o=args;region(b,b+3,k,m);entry(v,b,'I',k,m,o)

# Independent exposition of II; I is absent throughout 49-80.
for v in [0,2,3]:silence(v,49,52)
silence(0,53,60);silence(3,53,56)
entry(1,49,'II');entry(2,53,'II',2);entry(3,57,'II',octave=-2);entry(0,61,'II',2,octave=1)
region(53,56,2);region(61,64,2)
entry(2,73,'II',octave=-1);entry(1,77,'II',2,octave=0);region(77,80,2)

# Combined exposition: BOTH subjects traverse all four instruments.
for bar,av,ao,bv,bo,key in [(81,3,-1,1,0,7),(85,2,0,0,1,7),(89,1,1,3,-1,2),(93,0,1,2,-1,7)]:
    region(bar,bar+3,key);entry(av,bar,'I',key,octave=ao);entry(bv,bar,'II',key,octave=bo)
# Development of the combined pair, including exchange of their registers.
for bar,av,ao,bv,bo,key,minor in [(105,1,1,3,-1,4,True),(109,2,0,0,1,9,True),(113,0,2,1,0,0,False),(117,3,-1,1,0,2,False)]:
    region(bar,bar+3,key,minor);entry(av,bar,'I',key,minor,ao);entry(bv,bar,'II',key,minor,bo)
# The viola takes a quarter-note breath after its high A-minor entry;
# the next entry belongs to the violins in a new register.
install(2,113,[(-1,4)])
# Final tonic group, alternately projecting the high sigh and the low current.
for bar,av,ao,bv,bo in [(129,0,1,3,-2),(133,2,0,1,0),(137,1,0,0,1),(141,3,-1,2,-1)]:
    entry(av,bar,'I',octave=ao);entry(bv,bar,'II',octave=bo)

# The cadential bass moves within beat 3 to support the sigh's upward
# appoggiatura. These written eighths avoid both a hidden fifth and the
# disjunct seventh that a quarter-note-only bass would otherwise require.
install(3,96,parse("g,2 a,8 d8 g,4"))
install(3,116,parse("c2 d8 g8 c4"))

# Episodes: authored thematic lines over descending-fifth harmonic spans.
episode_melodies=[
 "e''8 d''8 e''8 c''8 b'4 a'4",
 "d''8 c''8 d''8 b'8 a'4 g'4",
 "c''8 b'8 c''8 a'8 g'4 fis'4",
 "b'4 a'8 g'8 fis'4 a'4",
 "g''8 fis''8 e''8 d''8 c''4 b'4",
 "e''8 d''8 c''8 b'8 a'4 c''4",
 "b'8 a'8 g'8 fis'8 e'4 fis'4",
 "g'4 b'4 a'4 fis'4",
]
for first,last,key,minor in [(17,24,7,False),(41,48,7,False),(65,72,7,False),(97,104,0,False)]:
    region(first,last,key,minor)
    for i,b in enumerate(range(first,last+1)):
        voice=[0,1,0,2,0,1,2,0][i]
        octave=0 if voice<2 or key==0 else -1
        if key==0 and i==7:octave=1
        install(voice,b,parse(episode_melodies[i]),key,minor,octave)
        HARM[b-1]=[[5,5,3,3],[1,1,4,4],[0,0,5,5],[1,1,4,4],[3,3,0,0],[1,1,1,1],[4,4,4,4],[0,0,4,4]][i]
# A true tonic cadential landing before the second exposition; a light breath.
for v in range(4):
    # Replacement only of the last bar of the episode, deliberately authored.
    start=47*16
    FIXED[v][start:start+16]=[None]*16
    FSTART[v]={t for t in FSTART[v] if not start<=t<start+16}
    AUTHOR[v]=[e for e in AUTHOR[v] if not start<=e['t']<start+16]
for v,p in enumerate([79,71,62,43]):install(v,48,[(p,16)] if v==3 else [(p,12),(-1,4)])
HARM[47]=[0]*4

# Complete subject I in rhythmic augmentation over a dominant pedal.
install(0,121,[(p,d*2) for p,d in A],octave=1,label='I (augmentation)')
# Dominant pedal under the enlarged theme, released into final entries.
for b in range(121,129):
    if FIXED[3][(b-1)*16] is None:install(3,b,[(50,16)])
    HARM[b-1]=[4,4,4,4]
# Coda: deliberately written four-part cadence, with a 4-3 suspension in 147.
coda=[
 ["e''2 d''8 e''8 c''8 b'8", "a'4 b'4 c''4 a'4", "g'2 g'4 fis'4", "a'2 fis'2", "g'1", "g'1"],
 ["g'2 fis'4 e'4", "fis'4 g'4 g'4 fis'4", "d'1", "fis'2 d'2", "d'1", "d'1"],
 ["e'2 a4 c'4", "d'4 d'4 e'4 a4", "b2 a2", "c'2 a4 c'4", "b1", "b1"],
 ["c2 d4 a,4", "d4 g,4 c4 d4", "g,2 d2", "d1", "g,1", "g,1"]
]
for v in range(4):
    for i,s in enumerate(coda[v]):install(v,145+i,parse(s))

# Voice-leading realization at quarter-note structural positions.
def chord(key,minor,degree):
    sc=[0,2,3,5,7,8,10] if minor else SCALE
    pcs={(key+sc[(degree+x)%7])%12 for x in (0,2,4)}
    if minor and degree==4:pcs.discard((key+10)%12);pcs.add((key+11)%12)
    return pcs

def parallel(a,b):
    total=np.zeros(len(b),dtype=float)
    for i,j in itertools.combinations(range(4),2):
        if a[i]<0 or a[j]<0:continue
        active=(b[:,i]>=0)&(b[:,j]>=0)
        old=abs(a[i]-a[j])%12; new=np.abs(b[:,i]-b[:,j])%12
        motion=(b[:,i]-a[i])*(b[:,j]-a[j])
        similar=motion>0
        if old in (0,7):total+=active*(motion!=0)*(new==old)*240
        # Direct outer perfects with a leaping upper line.
        if (i,j)==(0,3):total+=active*similar*np.isin(new,[0,7])*(np.abs(b[:,i]-a[i])>2)*35
    return total

# A conservative embellisher: passing notes only between structural thirds.
# Repeated notes are merged selectively, so supporting lines have different
# rhythms. The independent audit checks the final elaborated music again.
def elaborate(skeleton):
    events=[list(a) for a in AUTHOR]
    for v in range(4):
        for q,p in enumerate(skeleton[:,v]):
            t=q*4
            if FIXED[v][t] is not None:continue
            b=q//4
            nextp=skeleton[q+1,v] if q+1<len(skeleton) else p
            key,minor=KEYS[b]
            scale={(key+x)%12 for x in ([0,2,3,5,7,8,10] if minor else SCALE)}
            subdivide=(q+v*2)%5 in (0,2) and b not in range(144,150)
            passing=None
            if subdivide and abs(int(nextp)-int(p)) in (3,4):
                middle=[n for n in range(min(p,nextp)+1,max(p,nextp)) if n%12 in scale]
                if len(middle)==1:passing=middle[0]
            if passing is not None:
                # Avoid newly introduced parallel perfects on the subdivision.
                before=np.array([FIXED[w][t+1] if FIXED[w][t+1] is not None else skeleton[q,w] for w in range(4)])
                after=np.array([FIXED[w][t+2] if FIXED[w][t+2] is not None else skeleton[q,w] for w in range(4)])
                after[v]=passing
                following=skeleton[min(q+1,len(skeleton)-1)].copy()
                if t+4<16*N:
                    for w in range(4):
                        if FIXED[w][t+4] is not None:following[w]=FIXED[w][t+4]
                if parallel(before,after[None,:])[0]>0 or parallel(after,following[None,:])[0]>0:passing=None
            if passing is None:events[v].append(dict(t=t,p=int(p),d=4,kind='free'))
            else:
                events[v].append(dict(t=t,p=int(p),d=2,kind='free'))
                events[v].append(dict(t=t+2,p=int(passing),d=2,kind='passing'))
        events[v].sort(key=lambda e:e['t'])
        # Tie adjacent repeated free tones within a bar, preserving entries.
        merged=[]
        for e in events[v]:
            if merged and e['kind']=='free' and merged[-1]['kind']=='free' and e['p']==merged[-1]['p'] and e['t']//16==merged[-1]['t']//16 and merged[-1]['d']+e['d'] in (8,12,16):
                merged[-1]['d']+=e['d']
            else:merged.append(e.copy())
        events[v]=merged
    return events


def pitch_name(p):
    if p<0:return 'r'
    octave=p//12-4
    return NAMES[p%12]+("'"*octave if octave>=0 else ','*(-octave))
DURS={1:'16',2:'8',3:'8.',4:'4',6:'4.',8:'2',12:'2.',16:'1'}

def emit(events):
    lines=[r'\version "2.24.3"',r'\pointAndClickOff',r'#(set-global-staff-size 16)',r'''\header {
  title = "The Two Springs"
  subtitle = "Double Fugue in G major for String Quartet"
  subsubtitle = "On the opening of Abing's Erquan Yingyue"
  composer = "New composition: OpenAI / Codex (2026)"
  poet = "Thematic source: Hua Yanjun (Abing)"
  tagline = ##f
}
\paper {
  #(set-paper-size "a4")
  top-margin = 12\mm
  bottom-margin = 12\mm
  left-margin = 14\mm
  right-margin = 12\mm
  indent = 14\mm
  short-indent = 6\mm
  ragged-last-bottom = ##f
  system-system-spacing.basic-distance = #22
  system-system-spacing.minimum-distance = #18
  score-markup-spacing.basic-distance = #10
  print-page-number = ##t
}
global = { \key g \major \time 4/4 }
layoutMarks = {
  \numericTimeSignature \tempo "Andante con moto, cantabile" 4 = 100
  \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \set Score.barNumberVisibility = #all-bar-numbers-visible
''']
    page_starts=list(range(1,146,12)) # 13 pages, last page 145-150
    for bar in range(1,N+1):
        if bar in SECTIONS:lines.append(r'  \mark \markup \box \small "'+SECTIONS[bar]+'"')
        if bar==145:lines.append(r'  \tempo "Poco meno mosso" 4 = 80')
        lines.append('  s1')
        if bar<N:
            if bar+1 in page_starts:lines.append(r'  \pageBreak')
            elif bar%4==0:lines.append(r'  \break')
            else:lines.append(r'  \noBreak')
    lines.append('}')
    for v in range(4):
        lines.append(VOICES[v]+' = {')
        for bar in range(1,N+1):
            ev=[e for e in events[v] if e['t']//16==bar-1]
            assert sum(e['d'] for e in ev)==16,(v,bar,ev)
            tokens=[]
            if bar>1 and KEYS[bar-1]!=KEYS[bar-2]:
                k,m=KEYS[bar-1]
                tokens.append('\\key '+NAMES[k]+(' \\minor' if m else ' \\major'))
            for j,e in enumerate(ev):
                tok=pitch_name(e['p'])+DURS[e['d']]
                if j==0 and bar in DYNAMICS:tok+='\\'+DYNAMICS[bar]
                if j==0:
                    tag=next((x['subject'] for x in ENTRIES if x['voice_id']==v and x['bar']==bar),None)
                    if tag:tok+='^\\markup \\tiny \\bold "'+tag+'"'
                # Small slurs clarify the subject's sigh and ornament groups.
                if j<len(ev)-1 and e['p']>=0 and e['d']<=2 and ev[j+1]['p']>=0 and ev[j+1]['d']<=2:
                    if j==0 or not (ev[j-1]['p']>=0 and ev[j-1]['d']<=2):tok+='('
                if j>0 and e['p']>=0 and e['d']<=2 and ev[j-1]['p']>=0 and ev[j-1]['d']<=2:
                    if j==len(ev)-1 or not (ev[j+1]['p']>=0 and ev[j+1]['d']<=2):tok+=')'
                if (bar==147 and v==0 and j==0) or bar==149:tok+='~'
                if bar==150 and e['p']>=0:tok+='\\fermata'
                tokens.append(tok)
            lines.append(f'  \\barNumberCheck #{bar} '+ ' '.join(tokens)+f' | % {bar}')
        lines.append(r'  \bar "|."'+'\n}')
    lines.append(r'''\score {
  \new StaffGroup <<
    \new Staff = "violinOne" \with { instrumentName = "Violin I" shortInstrumentName = "Vln. I" midiInstrument = "violin" midiPanPosition = #-0.55 } << \global \layoutMarks \violinOne >>
    \new Staff = "violinTwo" \with { instrumentName = "Violin II" shortInstrumentName = "Vln. II" midiInstrument = "violin" midiPanPosition = #-0.15 } { \global \violinTwo }
    \new Staff = "viola" \with { instrumentName = "Viola" shortInstrumentName = "Vla." midiInstrument = "viola" midiPanPosition = #0.2 } { \clef alto \global \viola }
    \new Staff = "cello" \with { instrumentName = "Violoncello" shortInstrumentName = "Vc." midiInstrument = "cello" midiPanPosition = #0.55 } { \clef bass \global \cello }
  >>
  \layout { \context { \Score autoBeaming = ##t } }
  \midi { }
}''')
    (ROOT/'score/two-springs.ly').write_text('\n'.join(lines)+'\n')
    structure=dict(bars=N,beats_per_bar=4,voices=LABELS,entries=ENTRIES,sections=SECTIONS,pages=[dict(page=i+1,first_bar=b,last_bar=min(b+11,N)) for i,b in enumerate(page_starts)])
    (ROOT/'score/structure.json').write_text(json.dumps(structure,indent=2)+'\n')
    (ROOT/'score/events.json').write_text(json.dumps(dict(unit='sixteenth note',bars=N,voices=events),indent=2)+'\n')
    print(f'Wrote {N} bars, {sum(map(len,events))} notes/rests, {len(ENTRIES)} complete subject entries.')

if __name__=='__main__':
    from realization import realize as constrained_realize
    emit(elaborate(constrained_realize(FIXED,KEYS,HARM,RANGES,CENTERS,SCALE,chord,AUTHOR)))
