\version "2.24.3"
\pointAndClickOff
#(set-global-staff-size 16)
\header {
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

  \mark \markup \box \small "I. The sigh"
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \pageBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  \mark \markup \box \small "First episode"
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \pageBreak
  \mark \markup \box \small "Wandering entries"
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \pageBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  \mark \markup \box \small "Threshold"
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \pageBreak
  \mark \markup \box \small "II. The answering current"
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \pageBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  \mark \markup \box \small "Second episode"
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \pageBreak
  \mark \markup \box \small "Subject II: return"
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  \mark \markup \box \small "III. Confluence"
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \pageBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \pageBreak
  \mark \markup \box \small "Sequence"
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  \mark \markup \box \small "Shadows"
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \pageBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \pageBreak
  \mark \markup \box \small "Dominant preparation"
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  \mark \markup \box \small "IV. The spring returns"
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \pageBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \pageBreak
  \mark \markup \box \small "Coda"
  \tempo "Poco meno mosso" 4 = 80
  s1
  \noBreak
  s1
  \noBreak
  s1
  \noBreak
  s1
  \break
  s1
  \noBreak
  s1
}
violinOne = {
  \barNumberCheck #1 r1\mp | % 1
  \barNumberCheck #2 r1 | % 2
  \barNumberCheck #3 r1 | % 3
  \barNumberCheck #4 r1 | % 4
  \barNumberCheck #5 \key d \major r1 | % 5
  \barNumberCheck #6 r1 | % 6
  \barNumberCheck #7 r1 | % 7
  \barNumberCheck #8 r1 | % 8
  \barNumberCheck #9 \key g \major e''2^\markup \tiny \bold "I" d''8( e''8 c''8 b'8) | % 9
  \barNumberCheck #10 a'2 a'8. b'16( g'8 g'16 a'16) | % 10
  \barNumberCheck #11 b'4. d''8( e''8 d''8 e''16 d''16 e''16 g''16) | % 11
  \barNumberCheck #12 d''8. b'16( d''8 d''16 b'16 a'8 e''8 d''16 e''16 g''16 a''16) | % 12
  \barNumberCheck #13 \key d \major fis''4\mf d''4 e''4 b'4 | % 13
  \barNumberCheck #14 b'2. d''4 | % 14
  \barNumberCheck #15 d''1 | % 15
  \barNumberCheck #16 fis''2 g''4 fis''4 | % 16
  \barNumberCheck #17 \key g \major e''8\mp( d''8 e''8 c''8) b'4 a'4 | % 17
  \barNumberCheck #18 d''1 | % 18
  \barNumberCheck #19 c''8( b'8 c''8 a'8) g'4 fis'4 | % 19
  \barNumberCheck #20 b'4 c''4 d''4 fis''4 | % 20
  \barNumberCheck #21 g''8( fis''8 e''8 d''8) c''4 b'4 | % 21
  \barNumberCheck #22 e''1 | % 22
  \barNumberCheck #23 d''2 a'2 | % 23
  \barNumberCheck #24 g'4 b'4 a'4 fis'4 | % 24
  \barNumberCheck #25 \key e \minor c''2\mf^\markup \tiny \bold "I" b'8( c''8 a'8 g'8) | % 25
  \barNumberCheck #26 fis'2 fis'8. g'16( e'8 e'16 fis'16) | % 26
  \barNumberCheck #27 g'4. b'8( c''8 b'8 c''16 b'16 c''16 e''16) | % 27
  \barNumberCheck #28 b'8. g'16( b'8 b'16 g'16 fis'8 c''8 b'16 c''16 e''16 fis''16) | % 28
  \barNumberCheck #29 \key a \minor f''8( e''8) d''4 b'4 d''4 | % 29
  \barNumberCheck #30 d''2. f''4 | % 30
  \barNumberCheck #31 a''1 | % 31
  \barNumberCheck #32 c'''4 a''4 e''2 | % 32
  \barNumberCheck #33 \key c \major e''4 f''4 g''4 a''4 | % 33
  \barNumberCheck #34 f''2 a''4 f''4 | % 34
  \barNumberCheck #35 e''4 g''4 f''4 e''4 | % 35
  \barNumberCheck #36 e''2 g''8( f''8) e''4 | % 36
  \barNumberCheck #37 \key g \major g''4 e''4 a''4 e''4 | % 37
  \barNumberCheck #38 e''2 e''8( fis''8) g''4 | % 38
  \barNumberCheck #39 g''2. g''8( a''8) | % 39
  \barNumberCheck #40 b''2 fis''2 | % 40
  \barNumberCheck #41 e''8\p( d''8 e''8 c''8) b'4 a'4 | % 41
  \barNumberCheck #42 fis''4 fis''8( e''8) d''4 d''8( c''8) | % 42
  \barNumberCheck #43 c''8( b'8 c''8 a'8) g'4 fis'4 | % 43
  \barNumberCheck #44 g'4 c''4 fis''2 | % 44
  \barNumberCheck #45 g''8( fis''8 e''8 d''8) c''4 b'4 | % 45
  \barNumberCheck #46 e''1 | % 46
  \barNumberCheck #47 d''2 e''4 a''4 | % 47
  \barNumberCheck #48 g''2. r4 | % 48
  \barNumberCheck #49 r1\mp | % 49
  \barNumberCheck #50 r1 | % 50
  \barNumberCheck #51 r1 | % 51
  \barNumberCheck #52 r1 | % 52
  \barNumberCheck #53 \key d \major r1 | % 53
  \barNumberCheck #54 r1 | % 54
  \barNumberCheck #55 r1 | % 55
  \barNumberCheck #56 r1 | % 56
  \barNumberCheck #57 \key g \major r1 | % 57
  \barNumberCheck #58 r1 | % 58
  \barNumberCheck #59 r1 | % 59
  \barNumberCheck #60 r1 | % 60
  \barNumberCheck #61 \key d \major d''4\mf^\markup \tiny \bold "II" g''8( d''8) cis''4 e''4 | % 61
  \barNumberCheck #62 g''8( fis''8 g''8 e''8) g''4 b'8( cis''8) | % 62
  \barNumberCheck #63 d''8( cis''8 d''8 fis''8) g''4 d''4 | % 63
  \barNumberCheck #64 fis''8( e''8 fis''8 d''8) cis''4 fis''4 | % 64
  \barNumberCheck #65 \key g \major e''8\mp( d''8 e''8 c''8) b'4 a'4 | % 65
  \barNumberCheck #66 fis''2 d''2 | % 66
  \barNumberCheck #67 c''8( b'8 c''8 a'8) g'4 fis'4 | % 67
  \barNumberCheck #68 g'4 c''4 fis''2 | % 68
  \barNumberCheck #69 g''8( fis''8 e''8 d''8) c''4 b'4 | % 69
  \barNumberCheck #70 e''1 | % 70
  \barNumberCheck #71 d''2 a'2 | % 71
  \barNumberCheck #72 g'4 b'4 a'4 fis'4 | % 72
  \barNumberCheck #73 g'2\mf a'2 | % 73
  \barNumberCheck #74 a'2. c''4 | % 74
  \barNumberCheck #75 d''2 e''4 g''4 | % 75
  \barNumberCheck #76 d''2 d''8( c''8) b'4 | % 76
  \barNumberCheck #77 \key d \major d''2 e''4 g''4 | % 77
  \barNumberCheck #78 g''4 e''2 d''4 | % 78
  \barNumberCheck #79 fis''2 d''4 fis''8( g''8) | % 79
  \barNumberCheck #80 a''4 fis''4 e''4 fis''4 | % 80
  \barNumberCheck #81 \key g \major e''8\f( fis''8) g''4 a''4 e''4 | % 81
  \barNumberCheck #82 e''1 | % 82
  \barNumberCheck #83 b'4 d''4 c''4 b'4 | % 83
  \barNumberCheck #84 d''2 fis''2 | % 84
  \barNumberCheck #85 g''4^\markup \tiny \bold "II" c'''8( g''8) fis''4 a''4 | % 85
  \barNumberCheck #86 c'''8( b''8 c'''8 a''8) c'''4 e''8( fis''8) | % 86
  \barNumberCheck #87 g''8( fis''8 g''8 b''8) c'''4 g''4 | % 87
  \barNumberCheck #88 b''8( a''8 b''8 g''8) fis''4 b''4 | % 88
  \barNumberCheck #89 \key d \major b''8( a''8) g''4 e''4 g''8( a''8) | % 89
  \barNumberCheck #90 b''4 g''8( a''8) b''4 g''4 | % 90
  \barNumberCheck #91 fis''2 d''4 fis''4 | % 91
  \barNumberCheck #92 a''4 fis''4 a''4 fis''4 | % 92
  \barNumberCheck #93 \key g \major e''2^\markup \tiny \bold "I" d''8( e''8 c''8 b'8) | % 93
  \barNumberCheck #94 a'2 a'8. b'16( g'8 g'16 a'16) | % 94
  \barNumberCheck #95 b'4. d''8( e''8 d''8 e''16 d''16 e''16 g''16) | % 95
  \barNumberCheck #96 d''8. b'16( d''8 d''16 b'16 a'8 e''8 d''16 e''16 g''16 a''16) | % 96
  \barNumberCheck #97 \key c \major a'8\mp( g'8 a'8 f'8) e'4 d'4 | % 97
  \barNumberCheck #98 g'1 | % 98
  \barNumberCheck #99 f'8( e'8 f'8 d'8) c'4 b4 | % 99
  \barNumberCheck #100 e'4 a'4 g'4 b'4 | % 100
  \barNumberCheck #101 c''8( b'8 a'8 g'8) f'4 e'4 | % 101
  \barNumberCheck #102 a'1 | % 102
  \barNumberCheck #103 g'2 a'4 d''4 | % 103
  \barNumberCheck #104 c''4 e''4 d''4 b'4 | % 104
  \barNumberCheck #105 \key e \minor g''4\mf e''4 fis''2 | % 105
  \barNumberCheck #106 fis''2. a''4 | % 106
  \barNumberCheck #107 g''4 e''2 g''8( a''8) | % 107
  \barNumberCheck #108 b''4 g''4 b''8( a''8) g''4 | % 108
  \barNumberCheck #109 \key a \minor a''4^\markup \tiny \bold "II" d'''8( a''8) g''4 b''4 | % 109
  \barNumberCheck #110 d'''8( c'''8 d'''8 b''8) d'''4 f''8( g''8) | % 110
  \barNumberCheck #111 a''8( g''8 a''8 c'''8) d'''4 a''4 | % 111
  \barNumberCheck #112 c'''8( b''8 c'''8 a''8) g''4 c'''4 | % 112
  \barNumberCheck #113 \key c \major a''2^\markup \tiny \bold "I" g''8( a''8 f''8 e''8) | % 113
  \barNumberCheck #114 d''2 d''8. e''16( c''8 c''16 d''16) | % 114
  \barNumberCheck #115 e''4. g''8( a''8 g''8 a''16 g''16 a''16 c'''16) | % 115
  \barNumberCheck #116 g''8. e''16( g''8 g''16 e''16 d''8 a''8 g''16 a''16 c'''16 d'''16) | % 116
  \barNumberCheck #117 \key d \major d'''2\f e'''4 b''4 | % 117
  \barNumberCheck #118 b''4 g''4 b''2 | % 118
  \barNumberCheck #119 fis''2 d''2 | % 119
  \barNumberCheck #120 cis''4 a'4 cis''2 | % 120
  \barNumberCheck #121 \key g \major e''1\p^\markup \tiny \bold "I (augmentation)" | % 121
  \barNumberCheck #122 d''4 e''4 c''4 b'4 | % 122
  \barNumberCheck #123 a'1 | % 123
  \barNumberCheck #124 a'4. b'8 g'4 g'8( a'8) | % 124
  \barNumberCheck #125 b'2. d''4 | % 125
  \barNumberCheck #126 e''4 d''4 e''8( d''8 e''8 g''8) | % 126
  \barNumberCheck #127 d''4. b'8 d''4 d''8( b'8) | % 127
  \barNumberCheck #128 a'4 e''4 d''8( e''8 g''8 a''8) | % 128
  \barNumberCheck #129 e''2\f^\markup \tiny \bold "I" d''8( e''8 c''8 b'8) | % 129
  \barNumberCheck #130 a'2 a'8. b'16( g'8 g'16 a'16) | % 130
  \barNumberCheck #131 b'4. d''8( e''8 d''8 e''16 d''16 e''16 g''16) | % 131
  \barNumberCheck #132 d''8. b'16( d''8 d''16 b'16 a'8 e''8 d''16 e''16 g''16 a''16) | % 132
  \barNumberCheck #133 g''2 a''4 e''4 | % 133
  \barNumberCheck #134 e''1 | % 134
  \barNumberCheck #135 d''2 g''2 | % 135
  \barNumberCheck #136 g''2 a''4 g''4 | % 136
  \barNumberCheck #137 g''4^\markup \tiny \bold "II" c'''8( g''8) fis''4 a''4 | % 137
  \barNumberCheck #138 c'''8( b''8 c'''8 a''8) c'''4 e''8( fis''8) | % 138
  \barNumberCheck #139 g''8( fis''8 g''8 b''8) c'''4 g''4 | % 139
  \barNumberCheck #140 b''8( a''8 b''8 g''8) fis''4 b''4 | % 140
  \barNumberCheck #141 b''4 c'''4 d'''4 e'''4 | % 141
  \barNumberCheck #142 e'''4 c'''8( b''8) a''4 g''4 | % 142
  \barNumberCheck #143 d''2 c''4 b'4 | % 143
  \barNumberCheck #144 d''2 fis''2 | % 144
  \barNumberCheck #145 e''2\mf d''8( e''8 c''8 b'8) | % 145
  \barNumberCheck #146 a'4 b'4 c''4 a'4 | % 146
  \barNumberCheck #147 g'2~ g'4 fis'4 | % 147
  \barNumberCheck #148 a'2 fis'2 | % 148
  \barNumberCheck #149 g'1\p~ | % 149
  \barNumberCheck #150 g'1\fermata | % 150
  \bar "|."
}
violinTwo = {
  \barNumberCheck #1 r1\mp | % 1
  \barNumberCheck #2 r1 | % 2
  \barNumberCheck #3 r1 | % 3
  \barNumberCheck #4 r1 | % 4
  \barNumberCheck #5 \key d \major b'2^\markup \tiny \bold "I" a'8( b'8 g'8 fis'8) | % 5
  \barNumberCheck #6 e'2 e'8. fis'16( d'8 d'16 e'16) | % 6
  \barNumberCheck #7 fis'4. a'8( b'8 a'8 b'16 a'16 b'16 d''16) | % 7
  \barNumberCheck #8 a'8. fis'16( a'8 a'16 fis'16 e'8 b'8 a'16 b'16 d''16 e''16) | % 8
  \barNumberCheck #9 \key g \major b'4 c''8( b'8) a'4 g'8( fis'8) | % 9
  \barNumberCheck #10 e'1 | % 10
  \barNumberCheck #11 g'2. b'4 | % 11
  \barNumberCheck #12 b'2 fis'4 g'4 | % 12
  \barNumberCheck #13 \key d \major fis'4\mf g'4 e'2 | % 13
  \barNumberCheck #14 g'2. b'4 | % 14
  \barNumberCheck #15 a'2 g'4 fis'4 | % 15
  \barNumberCheck #16 a'2 e'4 fis'4 | % 16
  \barNumberCheck #17 \key g \major b'2.\mp fis'4 | % 17
  \barNumberCheck #18 d''8( c''8 d''8 b'8) a'4 g'4 | % 18
  \barNumberCheck #19 g'4 g'8( fis'8) e'4 d'4 | % 19
  \barNumberCheck #20 e'2 a'2 | % 20
  \barNumberCheck #21 c''2. g'4 | % 21
  \barNumberCheck #22 e''8( d''8 c''8 b'8) a'4 c''4 | % 22
  \barNumberCheck #23 fis'4 d'4 e'4 d'4 | % 23
  \barNumberCheck #24 d'4 d'8( e'8) fis'4 d'4 | % 24
  \barNumberCheck #25 \key e \minor e'2\mf dis'4 e'4 | % 25
  \barNumberCheck #26 fis'2. e'4 | % 26
  \barNumberCheck #27 e'2. g'4 | % 27
  \barNumberCheck #28 g'2 dis'4 g'4 | % 28
  \barNumberCheck #29 \key a \minor c''4 a'4 gis'4 a'4 | % 29
  \barNumberCheck #30 b'2 b'8( c''8) d''4 | % 30
  \barNumberCheck #31 e''2 d''4 c''8( b'8) | % 31
  \barNumberCheck #32 a'2 gis'4 a'4 | % 32
  \barNumberCheck #33 \key c \major a'2^\markup \tiny \bold "I" g'8( a'8 f'8 e'8) | % 33
  \barNumberCheck #34 d'2 d'8. e'16( c'8 c'16 d'16) | % 34
  \barNumberCheck #35 e'4. g'8( a'8 g'8 a'16 g'16 a'16 c''16) | % 35
  \barNumberCheck #36 g'8. e'16( g'8 g'16 e'16 d'8 a'8 g'16 a'16 c''16 d''16) | % 36
  \barNumberCheck #37 \key g \major b'4 c''4 a'2 | % 37
  \barNumberCheck #38 c''8( b'8) a'4 c''8( d''8) e''4 | % 38
  \barNumberCheck #39 d''2 c''4 b'4 | % 39
  \barNumberCheck #40 b'2 fis''4 d''4 | % 40
  \barNumberCheck #41 b'2\p g'4 a'8( b'8) | % 41
  \barNumberCheck #42 d''8( c''8 d''8 b'8) a'4 g'4 | % 42
  \barNumberCheck #43 g'2 e'4 d'4 | % 43
  \barNumberCheck #44 e'2 a'2 | % 44
  \barNumberCheck #45 c''2. g'4 | % 45
  \barNumberCheck #46 e''8( d''8 c''8 b'8) a'4 c''4 | % 46
  \barNumberCheck #47 fis'4 b'4 a'2 | % 47
  \barNumberCheck #48 b'2. r4 | % 48
  \barNumberCheck #49 g'4\mp^\markup \tiny \bold "II" c''8( g'8) fis'4 a'4 | % 49
  \barNumberCheck #50 c''8( b'8 c''8 a'8) c''4 e'8( fis'8) | % 50
  \barNumberCheck #51 g'8( fis'8 g'8 b'8) c''4 g'4 | % 51
  \barNumberCheck #52 b'8( a'8 b'8 g'8) fis'4 b'4 | % 52
  \barNumberCheck #53 \key d \major b'2 a'4 b'4 | % 53
  \barNumberCheck #54 b'2. d''8( e''8) | % 54
  \barNumberCheck #55 fis''2 d''8( cis''8) b'4 | % 55
  \barNumberCheck #56 a'1 | % 56
  \barNumberCheck #57 \key g \major b'4 g'4 a'4 c''4 | % 57
  \barNumberCheck #58 e''2 e''8( d''8) c''4 | % 58
  \barNumberCheck #59 b'4 b'8( a'8) g'4 b'8( c''8) | % 59
  \barNumberCheck #60 d''4 b'4 a'4 g'4 | % 60
  \barNumberCheck #61 \key d \major fis'4\mf g'4 a'4 b'4 | % 61
  \barNumberCheck #62 b'2. g'4 | % 62
  \barNumberCheck #63 a'2 b'4 fis'4 | % 63
  \barNumberCheck #64 a'1 | % 64
  \barNumberCheck #65 \key g \major b'2\mp g'4 a'4 | % 65
  \barNumberCheck #66 d''8( c''8 d''8 b'8) a'4 g'4 | % 66
  \barNumberCheck #67 g'4 g'8( fis'8) e'4 d'4 | % 67
  \barNumberCheck #68 e'2 a'2 | % 68
  \barNumberCheck #69 c''2. g'4 | % 69
  \barNumberCheck #70 e''8( d''8 c''8 b'8) a'4 c''4 | % 70
  \barNumberCheck #71 fis'4 d'4 e'4 d'4 | % 71
  \barNumberCheck #72 d'4 d'8( e'8) fis'4 d'4 | % 72
  \barNumberCheck #73 b4\mf e'4 d'4 e'4 | % 73
  \barNumberCheck #74 e'2. g'8( a'8) | % 74
  \barNumberCheck #75 b'2 g'8( a'8) b'4 | % 75
  \barNumberCheck #76 b'4 g'4 a'4 e'4 | % 76
  \barNumberCheck #77 \key d \major d'4^\markup \tiny \bold "II" g'8( d'8) cis'4 e'4 | % 77
  \barNumberCheck #78 g'8( fis'8 g'8 e'8) g'4 b8( cis'8) | % 78
  \barNumberCheck #79 d'8( cis'8 d'8 fis'8) g'4 d'4 | % 79
  \barNumberCheck #80 fis'8( e'8 fis'8 d'8) cis'4 fis'4 | % 80
  \barNumberCheck #81 \key g \major g'4\f^\markup \tiny \bold "II" c''8( g'8) fis'4 a'4 | % 81
  \barNumberCheck #82 c''8( b'8 c''8 a'8) c''4 e'8( fis'8) | % 82
  \barNumberCheck #83 g'8( fis'8 g'8 b'8) c''4 g'4 | % 83
  \barNumberCheck #84 b'8( a'8 b'8 g'8) fis'4 b'4 | % 84
  \barNumberCheck #85 b'4 g'4 a'4 e'4 | % 85
  \barNumberCheck #86 e'1 | % 86
  \barNumberCheck #87 d'2 g'2 | % 87
  \barNumberCheck #88 g'2 a'4 b'4 | % 88
  \barNumberCheck #89 \key d \major b'2^\markup \tiny \bold "I" a'8( b'8 g'8 fis'8) | % 89
  \barNumberCheck #90 e'2 e'8. fis'16( d'8 d'16 e'16) | % 90
  \barNumberCheck #91 fis'4. a'8( b'8 a'8 b'16 a'16 b'16 d''16) | % 91
  \barNumberCheck #92 a'8. fis'16( a'8 a'16 fis'16 e'8 b'8 a'16 b'16 d''16 e''16) | % 92
  \barNumberCheck #93 \key g \major b'4 c''4 a'4 e'4 | % 93
  \barNumberCheck #94 e'1 | % 94
  \barNumberCheck #95 d'2 g'2 | % 95
  \barNumberCheck #96 g'2 a'4 b'4 | % 96
  \barNumberCheck #97 \key c \major a'2\mp e'4 b4 | % 97
  \barNumberCheck #98 g'8( f'8 g'8 e'8) d'4 c'4 | % 98
  \barNumberCheck #99 c'2. g4 | % 99
  \barNumberCheck #100 e'4 f'4 d'4 g'4 | % 100
  \barNumberCheck #101 f'2. c'4 | % 101
  \barNumberCheck #102 a'8( g'8 f'8 e'8) d'4 f'4 | % 102
  \barNumberCheck #103 g'2 d'2 | % 103
  \barNumberCheck #104 g'2. b'4 | % 104
  \barNumberCheck #105 \key e \minor c''2\mf^\markup \tiny \bold "I" b'8( c''8 a'8 g'8) | % 105
  \barNumberCheck #106 fis'2 fis'8. g'16( e'8 e'16 fis'16) | % 106
  \barNumberCheck #107 g'4. b'8( c''8 b'8 c''16 b'16 c''16 e''16) | % 107
  \barNumberCheck #108 b'8. g'16( b'8 b'16 g'16 fis'8 c''8 b'16 c''16 e''16 fis''16) | % 108
  \barNumberCheck #109 \key a \minor f''4 a''4 e''4 g''4 | % 109
  \barNumberCheck #110 g''4 d''2. | % 110
  \barNumberCheck #111 e''2 d''4 c''8( b'8) | % 111
  \barNumberCheck #112 a'2 d'4 e'4 | % 112
  \barNumberCheck #113 \key c \major c'4^\markup \tiny \bold "II" f'8( c'8) b4 d'4 | % 113
  \barNumberCheck #114 f'8( e'8 f'8 d'8) f'4 a8( b8) | % 114
  \barNumberCheck #115 c'8( b8 c'8 e'8) f'4 c'4 | % 115
  \barNumberCheck #116 e'8( d'8 e'8 c'8) b4 e'4 | % 116
  \barNumberCheck #117 \key d \major d'4\f^\markup \tiny \bold "II" g'8( d'8) cis'4 e'4 | % 117
  \barNumberCheck #118 g'8( fis'8 g'8 e'8) g'4 b8( cis'8) | % 118
  \barNumberCheck #119 d'8( cis'8 d'8 fis'8) g'4 d'4 | % 119
  \barNumberCheck #120 fis'8( e'8 fis'8 d'8) cis'4 fis'4 | % 120
  \barNumberCheck #121 \key g \major b2.\p b8( c'8) | % 121
  \barNumberCheck #122 d'4 a2 d'4 | % 122
  \barNumberCheck #123 d'8( e'8) fis'2. | % 123
  \barNumberCheck #124 fis'4 fis'8( e'8) d'4 d'8( e'8) | % 124
  \barNumberCheck #125 fis'2 fis'8( g'8) a'4 | % 125
  \barNumberCheck #126 a'1 | % 126
  \barNumberCheck #127 a'4 fis'8( g'8) a'4 fis'4 | % 127
  \barNumberCheck #128 fis'8( g'8) a'2 b'4 | % 128
  \barNumberCheck #129 b'4\f g'4 a'4 e'4 | % 129
  \barNumberCheck #130 e'1 | % 130
  \barNumberCheck #131 d'2 g'2 | % 131
  \barNumberCheck #132 g'2 a'4 b'4 | % 132
  \barNumberCheck #133 g'4^\markup \tiny \bold "II" c''8( g'8) fis'4 a'4 | % 133
  \barNumberCheck #134 c''8( b'8 c''8 a'8) c''4 e'8( fis'8) | % 134
  \barNumberCheck #135 g'8( fis'8 g'8 b'8) c''4 g'4 | % 135
  \barNumberCheck #136 b'8( a'8 b'8 g'8) fis'4 b'4 | % 136
  \barNumberCheck #137 e'2^\markup \tiny \bold "I" d'8( e'8 c'8 b8) | % 137
  \barNumberCheck #138 a2 a8. b16( g8 g16 a16) | % 138
  \barNumberCheck #139 b4. d'8( e'8 d'8 e'16 d'16 e'16 g'16) | % 139
  \barNumberCheck #140 d'8. b16( d'8 d'16 b16 a8 e'8 d'16 e'16 g'16 a'16) | % 140
  \barNumberCheck #141 g'2 a'4 e'4 | % 141
  \barNumberCheck #142 e'1 | % 142
  \barNumberCheck #143 d'2 g'2 | % 143
  \barNumberCheck #144 fis'4 d'4 a'4 fis'4 | % 144
  \barNumberCheck #145 g'2\mf fis'4 e'4 | % 145
  \barNumberCheck #146 fis'4 g'4 g'4 fis'4 | % 146
  \barNumberCheck #147 d'1 | % 147
  \barNumberCheck #148 fis'2 d'2 | % 148
  \barNumberCheck #149 d'1\p~ | % 149
  \barNumberCheck #150 d'1\fermata | % 150
  \bar "|."
}
viola = {
  \barNumberCheck #1 e'2\mp^\markup \tiny \bold "I" d'8( e'8 c'8 b8) | % 1
  \barNumberCheck #2 a2 a8. b16( g8 g16 a16) | % 2
  \barNumberCheck #3 b4. d'8( e'8 d'8 e'16 d'16 e'16 g'16) | % 3
  \barNumberCheck #4 d'8. b16( d'8 d'16 b16 a8 e'8 d'16 e'16 g'16 a'16) | % 4
  \barNumberCheck #5 \key d \major g'2 fis'4 e'4 | % 5
  \barNumberCheck #6 e'2. b8( cis'8) | % 6
  \barNumberCheck #7 d'1 | % 7
  \barNumberCheck #8 d'2 cis'4 d'4 | % 8
  \barNumberCheck #9 \key g \major e'2 fis'4 e'4 | % 9
  \barNumberCheck #10 c'1 | % 10
  \barNumberCheck #11 b2 c'4 g4 | % 11
  \barNumberCheck #12 g2 a4 b4 | % 12
  \barNumberCheck #13 \key d \major d'2\mf cis'4 b4 | % 13
  \barNumberCheck #14 b1 | % 14
  \barNumberCheck #15 d'1 | % 15
  \barNumberCheck #16 cis'4 fis'4 b4 cis'4 | % 16
  \barNumberCheck #17 \key g \major g'2.\mp fis'4 | % 17
  \barNumberCheck #18 a'2 fis'4 d'4 | % 18
  \barNumberCheck #19 e'2 b2 | % 19
  \barNumberCheck #20 b4 a8( g8) fis4 a4 | % 20
  \barNumberCheck #21 e4 g2. | % 21
  \barNumberCheck #22 a4 c'4 c'8( b8) a4 | % 22
  \barNumberCheck #23 b8( a8 g8 fis8) e4 fis4 | % 23
  \barNumberCheck #24 g2 fis4 a4 | % 24
  \barNumberCheck #25 \key e \minor c'8\mf( b8) a4 fis8( g8) a4 | % 25
  \barNumberCheck #26 a1 | % 26
  \barNumberCheck #27 b2 a4 g4 | % 27
  \barNumberCheck #28 b2 dis'2 | % 28
  \barNumberCheck #29 \key a \minor f'2^\markup \tiny \bold "I" e'8( f'8 d'8 c'8) | % 29
  \barNumberCheck #30 b2 b8. c'16( a8 a16 b16) | % 30
  \barNumberCheck #31 c'4. e'8( f'8 e'8 f'16 e'16 f'16 a'16) | % 31
  \barNumberCheck #32 e'8. c'16( e'8 e'16 c'16 b8 f'8 e'16 f'16 a'16 b'16) | % 32
  \barNumberCheck #33 \key c \major a'8( g'8) f'4 d'4 a4 | % 33
  \barNumberCheck #34 a1 | % 34
  \barNumberCheck #35 g2 c'2 | % 35
  \barNumberCheck #36 c'2 d'4 e'4 | % 36
  \barNumberCheck #37 \key g \major e'4 g'4 fis'4 e'4 | % 37
  \barNumberCheck #38 e'8( d'8) c'4 e'4 e'8( fis'8) | % 38
  \barNumberCheck #39 g'1 | % 39
  \barNumberCheck #40 fis'8( e'8) d'4 a4 b4 | % 40
  \barNumberCheck #41 b4\p g2 e4 | % 41
  \barNumberCheck #42 a2 fis8( e8) d4 | % 42
  \barNumberCheck #43 g2 b2 | % 43
  \barNumberCheck #44 b4 a8( g8) fis4 a4 | % 44
  \barNumberCheck #45 e8( fis8) g2. | % 45
  \barNumberCheck #46 a4 c'2 a4 | % 46
  \barNumberCheck #47 b8( a8 g8 fis8) e4 fis4 | % 47
  \barNumberCheck #48 d'2. r4 | % 48
  \barNumberCheck #49 r1\mp | % 49
  \barNumberCheck #50 r1 | % 50
  \barNumberCheck #51 r1 | % 51
  \barNumberCheck #52 r1 | % 52
  \barNumberCheck #53 \key d \major d'4^\markup \tiny \bold "II" g'8( d'8) cis'4 e'4 | % 53
  \barNumberCheck #54 g'8( fis'8 g'8 e'8) g'4 b8( cis'8) | % 54
  \barNumberCheck #55 d'8( cis'8 d'8 fis'8) g'4 d'4 | % 55
  \barNumberCheck #56 fis'8( e'8 fis'8 d'8) cis'4 fis'4 | % 56
  \barNumberCheck #57 \key g \major e'2 d'4 e'4 | % 57
  \barNumberCheck #58 e'4 a'2 g'4 | % 58
  \barNumberCheck #59 d'2 e'2 | % 59
  \barNumberCheck #60 d'1 | % 60
  \barNumberCheck #61 \key d \major b4\mf d'4 e'2 | % 61
  \barNumberCheck #62 b1 | % 62
  \barNumberCheck #63 a2 d'2 | % 63
  \barNumberCheck #64 cis'4 d'4 e'4 d'4 | % 64
  \barNumberCheck #65 \key g \major b8\mp( a8) g4 g8( fis8) e4 | % 65
  \barNumberCheck #66 a4 a8( g8) fis4 d4 | % 66
  \barNumberCheck #67 g2 b2 | % 67
  \barNumberCheck #68 b4 a8( g8) fis4 a4 | % 68
  \barNumberCheck #69 e4 g2. | % 69
  \barNumberCheck #70 a8( b8) c'4 c'8( b8) a4 | % 70
  \barNumberCheck #71 b8( a8 g8 fis8) e4 fis4 | % 71
  \barNumberCheck #72 g2 fis8( g8) a4 | % 72
  \barNumberCheck #73 g4\mf^\markup \tiny \bold "II" c'8( g8) fis4 a4 | % 73
  \barNumberCheck #74 c'8( b8 c'8 a8) c'4 e8( fis8) | % 74
  \barNumberCheck #75 g8( fis8 g8 b8) c'4 g4 | % 75
  \barNumberCheck #76 b8( a8 b8 g8) fis4 b4 | % 76
  \barNumberCheck #77 \key d \major b4 d'4 a4 b4 | % 77
  \barNumberCheck #78 b2. g4 | % 78
  \barNumberCheck #79 a2 b2 | % 79
  \barNumberCheck #80 a2 cis'4 a4 | % 80
  \barNumberCheck #81 \key g \major g2\f d4 e4 | % 81
  \barNumberCheck #82 e1 | % 82
  \barNumberCheck #83 d2 g2 | % 83
  \barNumberCheck #84 fis4 b4 fis'4 d'4 | % 84
  \barNumberCheck #85 e'2^\markup \tiny \bold "I" d'8( e'8 c'8 b8) | % 85
  \barNumberCheck #86 a2 a8. b16( g8 g16 a16) | % 86
  \barNumberCheck #87 b4. d'8( e'8 d'8 e'16 d'16 e'16 g'16) | % 87
  \barNumberCheck #88 d'8. b16( d'8 d'16 b16 a8 e'8 d'16 e'16 g'16 a'16) | % 88
  \barNumberCheck #89 \key d \major fis'4 d'4 e'4 b4 | % 89
  \barNumberCheck #90 b1 | % 90
  \barNumberCheck #91 a2 d'2 | % 91
  \barNumberCheck #92 d'2 a2 | % 92
  \barNumberCheck #93 \key g \major g4^\markup \tiny \bold "II" c'8( g8) fis4 a4 | % 93
  \barNumberCheck #94 c'8( b8 c'8 a8) c'4 e8( fis8) | % 94
  \barNumberCheck #95 g8( fis8 g8 b8) c'4 g4 | % 95
  \barNumberCheck #96 b8( a8 b8 g8) fis4 b4 | % 96
  \barNumberCheck #97 \key c \major c'2.\mp b4 | % 97
  \barNumberCheck #98 d'2 b4 g4 | % 98
  \barNumberCheck #99 c'4 a8( b8) c'4 e4 | % 99
  \barNumberCheck #100 e'4 d'8( c'8) b4 d'4 | % 100
  \barNumberCheck #101 c'1 | % 101
  \barNumberCheck #102 d'4 a4 d'2 | % 102
  \barNumberCheck #103 e'8( d'8 c'8 b8) a4 b4 | % 103
  \barNumberCheck #104 c'2 d'2 | % 104
  \barNumberCheck #105 \key e \minor c'2\mf d'2 | % 105
  \barNumberCheck #106 fis'2. e'4 | % 106
  \barNumberCheck #107 b2 e'2 | % 107
  \barNumberCheck #108 e'2 fis'4 e'4 | % 108
  \barNumberCheck #109 \key a \minor f'2^\markup \tiny \bold "I" e'8( f'8 d'8 c'8) | % 109
  \barNumberCheck #110 b2 b8. c'16( a8 a16 b16) | % 110
  \barNumberCheck #111 c'4. e'8( f'8 e'8 f'16 e'16 f'16 a'16) | % 111
  \barNumberCheck #112 e'8. c'16( e'8 e'16 c'16 b8 f'8 e'16 f'16 a'16 b'16) | % 112
  \barNumberCheck #113 \key c \major r4 c'4 g4 a4 | % 113
  \barNumberCheck #114 a1 | % 114
  \barNumberCheck #115 g2 c'8( b8) a4 | % 115
  \barNumberCheck #116 g2 d4 g4 | % 116
  \barNumberCheck #117 \key d \major fis4\f g4 e4 g4 | % 117
  \barNumberCheck #118 b1 | % 118
  \barNumberCheck #119 a2 d'4 b4 | % 119
  \barNumberCheck #120 a2 e4 fis4 | % 120
  \barNumberCheck #121 \key g \major b1\p | % 121
  \barNumberCheck #122 a2 a8( g8) fis4 | % 122
  \barNumberCheck #123 fis8( g8) a2. | % 123
  \barNumberCheck #124 a4 fis4 b4 d'4 | % 124
  \barNumberCheck #125 d'2 d'8( e'8) fis'4 | % 125
  \barNumberCheck #126 a'4 fis'4 a'4 a'8( g'8) | % 126
  \barNumberCheck #127 fis'4 d'4 fis'8( e'8) d'4 | % 127
  \barNumberCheck #128 d'4 a2 d'8( c'8) | % 128
  \barNumberCheck #129 b4\f c'8( b8) a4 c'4 | % 129
  \barNumberCheck #130 e'8( d'8) c'2. | % 130
  \barNumberCheck #131 b4 b8( a8) g4 b8( c'8) | % 131
  \barNumberCheck #132 d'4 b4 d'2 | % 132
  \barNumberCheck #133 e'2^\markup \tiny \bold "I" d'8( e'8 c'8 b8) | % 133
  \barNumberCheck #134 a2 a8. b16( g8 g16 a16) | % 134
  \barNumberCheck #135 b4. d'8( e'8 d'8 e'16 d'16 e'16 g'16) | % 135
  \barNumberCheck #136 d'8. b16( d'8 d'16 b16 a8 e'8 d'16 e'16 g'16 a'16) | % 136
  \barNumberCheck #137 e'2 b4 c'4 | % 137
  \barNumberCheck #138 a4 e2. | % 138
  \barNumberCheck #139 d2 g2 | % 139
  \barNumberCheck #140 fis4 g4 a4 b4 | % 140
  \barNumberCheck #141 g4^\markup \tiny \bold "II" c'8( g8) fis4 a4 | % 141
  \barNumberCheck #142 c'8( b8 c'8 a8) c'4 e8( fis8) | % 142
  \barNumberCheck #143 g8( fis8 g8 b8) c'4 g4 | % 143
  \barNumberCheck #144 b8( a8 b8 g8) fis4 b4 | % 144
  \barNumberCheck #145 e'2\mf a4 a4 | % 145
  \barNumberCheck #146 d'4 d'4 e'4 a4 | % 146
  \barNumberCheck #147 b2 a2 | % 147
  \barNumberCheck #148 c'2 a4 c'4 | % 148
  \barNumberCheck #149 b1\p~ | % 149
  \barNumberCheck #150 b1\fermata | % 150
  \bar "|."
}
cello = {
  \barNumberCheck #1 r1\mp | % 1
  \barNumberCheck #2 r1 | % 2
  \barNumberCheck #3 r1 | % 3
  \barNumberCheck #4 r1 | % 4
  \barNumberCheck #5 \key d \major r1 | % 5
  \barNumberCheck #6 r1 | % 6
  \barNumberCheck #7 r1 | % 7
  \barNumberCheck #8 r1 | % 8
  \barNumberCheck #9 \key g \major r1 | % 9
  \barNumberCheck #10 r1 | % 10
  \barNumberCheck #11 r1 | % 11
  \barNumberCheck #12 r1 | % 12
  \barNumberCheck #13 \key d \major b2\mf^\markup \tiny \bold "I" a8( b8 g8 fis8) | % 13
  \barNumberCheck #14 e2 e8. fis16( d8 d16 e16) | % 14
  \barNumberCheck #15 fis4. a8( b8 a8 b16 a16 b16 d'16) | % 15
  \barNumberCheck #16 a8. fis16( a8 a16 fis16 e8 b8 a16 b16 d'16 e'16) | % 16
  \barNumberCheck #17 \key g \major e'2.\mp fis'4 | % 17
  \barNumberCheck #18 d'2. b4 | % 18
  \barNumberCheck #19 c'2 g8( a8) b4 | % 19
  \barNumberCheck #20 g4 a4 fis4 d4 | % 20
  \barNumberCheck #21 c2. e4 | % 21
  \barNumberCheck #22 c8( d8) e4 c2 | % 22
  \barNumberCheck #23 d4 b,4 c4 d8( c8) | % 23
  \barNumberCheck #24 b,2 d2 | % 24
  \barNumberCheck #25 \key e \minor c2\mf dis4 c8( b,8) | % 25
  \barNumberCheck #26 a,2. c4 | % 26
  \barNumberCheck #27 e2 c8( d8) e4 | % 27
  \barNumberCheck #28 e2 dis4 b,4 | % 28
  \barNumberCheck #29 \key a \minor a,4 f,4 gis,8( g,8) f,4 | % 29
  \barNumberCheck #30 d,1 | % 30
  \barNumberCheck #31 c,2 d,4 f,4 | % 31
  \barNumberCheck #32 a,8( b,8) c4 gis,4 c4 | % 32
  \barNumberCheck #33 \key c \major c4 a,4 b,4 a,4 | % 33
  \barNumberCheck #34 d2 f2 | % 34
  \barNumberCheck #35 c2 a,4 c4 | % 35
  \barNumberCheck #36 c2 b,4 e4 | % 36
  \barNumberCheck #37 \key g \major e2^\markup \tiny \bold "I" d8( e8 c8 b,8) | % 37
  \barNumberCheck #38 a,2 a,8. b,16( g,8 g,16 a,16) | % 38
  \barNumberCheck #39 b,4. d8( e8 d8 e16 d16 e16 g16) | % 39
  \barNumberCheck #40 d8. b,16( d8 d16 b,16 a,8 e8 d16 e16 g16 a16) | % 40
  \barNumberCheck #41 g4\p e2 c4 | % 41
  \barNumberCheck #42 d2 d8( c8) b,4 | % 42
  \barNumberCheck #43 e4 c4 g,4 b,4 | % 43
  \barNumberCheck #44 e4 c4 d2 | % 44
  \barNumberCheck #45 c2. e8( d8) | % 45
  \barNumberCheck #46 c4 e8( d8) c2 | % 46
  \barNumberCheck #47 d8( c8) b,4 c4 fis,4 | % 47
  \barNumberCheck #48 g,1 | % 48
  \barNumberCheck #49 r1\mp | % 49
  \barNumberCheck #50 r1 | % 50
  \barNumberCheck #51 r1 | % 51
  \barNumberCheck #52 r1 | % 52
  \barNumberCheck #53 \key d \major r1 | % 53
  \barNumberCheck #54 r1 | % 54
  \barNumberCheck #55 r1 | % 55
  \barNumberCheck #56 r1 | % 56
  \barNumberCheck #57 \key g \major g,4^\markup \tiny \bold "II" c8( g,8) fis,4 a,4 | % 57
  \barNumberCheck #58 c8( b,8 c8 a,8) c4 e,8( fis,8) | % 58
  \barNumberCheck #59 g,8( fis,8 g,8 b,8) c4 g,4 | % 59
  \barNumberCheck #60 b,8( a,8 b,8 g,8) fis,4 b,4 | % 60
  \barNumberCheck #61 \key d \major b,2\mf cis4 g,4 | % 61
  \barNumberCheck #62 b,4 e4 e8( fis8) g4 | % 62
  \barNumberCheck #63 fis2 b2 | % 63
  \barNumberCheck #64 a4 fis4 a8( g8) fis4 | % 64
  \barNumberCheck #65 \key g \major g8\mp( fis8) e2 c4 | % 65
  \barNumberCheck #66 d2. b,4 | % 66
  \barNumberCheck #67 e8( d8) c4 g,8( a,8) b,4 | % 67
  \barNumberCheck #68 e4 c4 d2 | % 68
  \barNumberCheck #69 c2 c8( d8) e4 | % 69
  \barNumberCheck #70 c8( d8) e4 c2 | % 70
  \barNumberCheck #71 d4 b,4 c4 d4 | % 71
  \barNumberCheck #72 b,2 d2 | % 72
  \barNumberCheck #73 e4\mf c4 fis,4 c8( b,8) | % 73
  \barNumberCheck #74 a,4 c2. | % 74
  \barNumberCheck #75 b,2 e4 e8( fis8) | % 75
  \barNumberCheck #76 g2 d4 g4 | % 76
  \barNumberCheck #77 \key d \major d8( cis8) b,4 cis4 g,4 | % 77
  \barNumberCheck #78 b,4 g,2 b,4 | % 78
  \barNumberCheck #79 d2 b,8( cis8) d4 | % 79
  \barNumberCheck #80 d2 e4 d4 | % 80
  \barNumberCheck #81 \key g \major e2\f^\markup \tiny \bold "I" d8( e8 c8 b,8) | % 81
  \barNumberCheck #82 a,2 a,8. b,16( g,8 g,16 a,16) | % 82
  \barNumberCheck #83 b,4. d8( e8 d8 e16 d16 e16 g16) | % 83
  \barNumberCheck #84 d8. b,16( d8 d16 b,16 a,8 e8 d16 e16 g16 a16) | % 84
  \barNumberCheck #85 e2 fis4 c4 | % 85
  \barNumberCheck #86 c1 | % 86
  \barNumberCheck #87 b,2 e2 | % 87
  \barNumberCheck #88 g2 d2 | % 88
  \barNumberCheck #89 \key d \major d4^\markup \tiny \bold "II" g8( d8) cis4 e4 | % 89
  \barNumberCheck #90 g8( fis8 g8 e8) g4 b,8( cis8) | % 90
  \barNumberCheck #91 d8( cis8 d8 fis8) g4 d4 | % 91
  \barNumberCheck #92 fis8( e8 fis8 d8) cis4 fis4 | % 92
  \barNumberCheck #93 \key g \major g4 e4 fis4 a,4 | % 93
  \barNumberCheck #94 a,4 c2. | % 94
  \barNumberCheck #95 b,2 e4 e8( fis8) | % 95
  \barNumberCheck #96 g2 d4 g4 | % 96
  \barNumberCheck #97 \key c \major a2.\mp b4 | % 97
  \barNumberCheck #98 g2. e4 | % 98
  \barNumberCheck #99 a4 f4 e2 | % 99
  \barNumberCheck #100 c4 f4 g2 | % 100
  \barNumberCheck #101 a4 f2 a4 | % 101
  \barNumberCheck #102 f8( e8) d4 f8( e8) d4 | % 102
  \barNumberCheck #103 g4 e4 f4 d4 | % 103
  \barNumberCheck #104 e4 c4 b,8( c8) d4 | % 104
  \barNumberCheck #105 \key e \minor e4\mf^\markup \tiny \bold "II" a8( e8) d4 fis4 | % 105
  \barNumberCheck #106 a8( g8 a8 fis8) a4 c8( d8) | % 106
  \barNumberCheck #107 e8( d8 e8 g8) a4 e4 | % 107
  \barNumberCheck #108 g8( fis8 g8 e8) d4 g4 | % 108
  \barNumberCheck #109 \key a \minor f4 d4 e4 b,4 | % 109
  \barNumberCheck #110 b,4 d4 b,4 d4 | % 110
  \barNumberCheck #111 c2 f2 | % 111
  \barNumberCheck #112 a2 b4 a4 | % 112
  \barNumberCheck #113 \key c \major a4 f4 g4 d4 | % 113
  \barNumberCheck #114 d2 d8( e8) f4 | % 114
  \barNumberCheck #115 e8( d8) c4 a,4 c4 | % 115
  \barNumberCheck #116 c2 d4 e4 | % 116
  \barNumberCheck #117 \key d \major b,2\f^\markup \tiny \bold "I" a,8( b,8 g,8 fis,8) | % 117
  \barNumberCheck #118 e,2 e,8. fis,16( d,8 d,16 e,16) | % 118
  \barNumberCheck #119 fis,4. a,8( b,8 a,8 b,16 a,16 b,16 d16) | % 119
  \barNumberCheck #120 a,8. fis,16( a,8 a,16 fis,16 e,8 b,8 a,16 b,16 d16 e16) | % 120
  \barNumberCheck #121 \key g \major d1\p | % 121
  \barNumberCheck #122 d1 | % 122
  \barNumberCheck #123 d1 | % 123
  \barNumberCheck #124 d1 | % 124
  \barNumberCheck #125 d1 | % 125
  \barNumberCheck #126 d1 | % 126
  \barNumberCheck #127 d1 | % 127
  \barNumberCheck #128 d1 | % 128
  \barNumberCheck #129 g,4\f^\markup \tiny \bold "II" c8( g,8) fis,4 a,4 | % 129
  \barNumberCheck #130 c8( b,8 c8 a,8) c4 e,8( fis,8) | % 130
  \barNumberCheck #131 g,8( fis,8 g,8 b,8) c4 g,4 | % 131
  \barNumberCheck #132 b,8( a,8 b,8 g,8) fis,4 b,4 | % 132
  \barNumberCheck #133 e4 c4 fis,4 c4 | % 133
  \barNumberCheck #134 a,4 c2. | % 134
  \barNumberCheck #135 b,2 e4 e8( fis8) | % 135
  \barNumberCheck #136 g2 d4 g4 | % 136
  \barNumberCheck #137 e8( d8) c4 d4 c4 | % 137
  \barNumberCheck #138 c1 | % 138
  \barNumberCheck #139 b,2 e2 | % 139
  \barNumberCheck #140 d8( c8) b,4 d2 | % 140
  \barNumberCheck #141 e2^\markup \tiny \bold "I" d8( e8 c8 b,8) | % 141
  \barNumberCheck #142 a,2 a,8. b,16( g,8 g,16 a,16) | % 142
  \barNumberCheck #143 b,4. d8( e8 d8 e16 d16 e16 g16) | % 143
  \barNumberCheck #144 d8. b,16( d8 d16 b,16 a,8 e8 d16 e16 g16 a16) | % 144
  \barNumberCheck #145 c2\mf d4 c4 | % 145
  \barNumberCheck #146 d4 g,4 e4 d4 | % 146
  \barNumberCheck #147 g,2 d2 | % 147
  \barNumberCheck #148 d1 | % 148
  \barNumberCheck #149 g,1\p~ | % 149
  \barNumberCheck #150 g,1\fermata | % 150
  \bar "|."
}
\score {
  \new StaffGroup <<
    \new Staff = "violinOne" \with { instrumentName = "Violin I" shortInstrumentName = "Vln. I" midiInstrument = "violin" midiPanPosition = #-0.55 } << \global \layoutMarks \violinOne >>
    \new Staff = "violinTwo" \with { instrumentName = "Violin II" shortInstrumentName = "Vln. II" midiInstrument = "violin" midiPanPosition = #-0.15 } { \global \violinTwo }
    \new Staff = "viola" \with { instrumentName = "Viola" shortInstrumentName = "Vla." midiInstrument = "viola" midiPanPosition = #0.2 } { \clef alto \global \viola }
    \new Staff = "cello" \with { instrumentName = "Violoncello" shortInstrumentName = "Vc." midiInstrument = "cello" midiPanPosition = #0.55 } { \clef bass \global \cello }
  >>
  \layout { \context { \Score autoBeaming = ##t } }
  \midi { }
}
