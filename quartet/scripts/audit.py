#!/usr/bin/env python3
"""Inspectable contrapuntal diagnostics, deliberately not an aesthetic grade."""
import argparse,itertools,json
from pathlib import Path
import numpy as np
ROOT=Path(__file__).resolve().parents[1]

def analyze(events):
    grid=np.full((2400,4),-1,dtype=int); attacks=[set() for _ in range(4)]
    ranges=[];leaps=[];parallel=[];strong=[];cross=[]
    for v,ev in enumerate(events):
        cursor=0;last=None
        for e in ev:
            assert e['t']==cursor,(v,cursor,e)
            cursor+=e['d'];grid[e['t']:cursor,v]=e['p'];attacks[v].add(e['t'])
            if e['p']>=0:
                if last is not None and abs(e['p']-last)>9:leaps.append(dict(voice=v,bar=e['t']//16+1,beat=e['t']%16/4+1,interval=e['p']-last))
                last=e['p']
            else:last=None
        assert cursor==2400
        pitches=[e['p'] for e in ev if e['p']>=0];ranges.append([min(pitches),max(pitches)])
    for t in range(1,2400):
        for i,j in itertools.combinations(range(4),2):
            a,b=grid[t-1,[i,j]],grid[t,[i,j]]
            if min(*a,*b)<0:continue
            old=abs(a[0]-a[1])%12;new=abs(b[0]-b[1])%12
            if old==new and new in (0,7) and (b[0]-a[0])*(b[1]-a[1])>0:
                parallel.append(dict(voices=[i,j],bar=t//16+1,beat=t%16/4+1,interval=int(new),from_midi=a.tolist(),to_midi=b.tolist()))
            if t%4==0 and b[0]<b[1]:cross.append(dict(voices=[i,j],bar=t//16+1,beat=t%16/4+1))
        if t%4==0:
            active=grid[t][grid[t]>=0]
            if len(active)>1:
                bass=min(active)
                for v,p in enumerate(grid[t]):
                    if p>=0 and (p-bass)%12 in (1,2,5,6,10,11):
                        strong.append(dict(voice=v,bar=t//16+1,beat=t%16/4+1,midi=int(p),bass=int(bass),interval=int((p-bass)%12)))
    return dict(bars=150,range_midi=ranges,parallel_perfect_intervals=parallel,leaps_over_major_sixth=leaps,accented_dissonances_above_bass=strong,structural_voice_crossings=cross)

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    result=analyze(json.loads((ROOT/'score/events.json').read_text())['voices'])
    (ROOT/'output/counterpoint-audit.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v if k in ('bars','range_midi') else len(v) for k,v in result.items()},indent=2))

    if args.check:
        assert not result['parallel_perfect_intervals'], 'Parallel fifths/octaves need review.'
        assert not result['structural_voice_crossings'], 'Voice crossing needs review.'
        assert all(abs(x['interval'])<=12 for x in result['leaps_over_major_sixth']), 'Melodic leap exceeds an octave.'
