\version "2.24.4"
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
  % m. 1
  \key g \major
  s1 |
  % m. 2
  s1 |
  % m. 3
  s1 |
  % m. 4
  s1 |
  % m. 5
  s1 |
  % m. 6
  s1 |
  % m. 7
  s1 |
  % m. 8
  s1 |
  % m. 9
  s1 |
  % m. 10
  s1 |
  % m. 11
  s1 |
  % m. 12
  s1 |
  % m. 13
  s1 |
  % m. 14
  s1 |
  % m. 15
  s1 |
  % m. 16
  s1 |
  % m. 17
  s1 |
  % m. 18
  s1 |
  % m. 19
  s1 |
  % m. 20
  s1 |
  % m. 21
  s1 |
  % m. 22
  s1 |
  % m. 23
  s1 |
  % m. 24
  s1 |
  % m. 25
  s1 |
  % m. 26
  s1 |
  % m. 27
  s1 |
  % m. 28
  s1 |
  % m. 29
  s1 |
  % m. 30
  s1 |
  % m. 31
  s1 |
  % m. 32
  s1 |
  % m. 33
  s1 |
  % m. 34
  s1 |
  % m. 35
  s1 |
  % m. 36
  s1 |
  % m. 37
  s1 |
  % m. 38
  s1 |
  % m. 39
  s1 |
  % m. 40
  s1 |
  % m. 41
  \key d \major
  s1 |
  % m. 42
  s1 |
  % m. 43
  s1 |
  % m. 44
  s1 |
  % m. 45
  s1 |
  % m. 46
  s1 |
  % m. 47
  s1 |
  % m. 48
  s1 |
  % m. 49
  s1 |
  % m. 50
  s1 |
  % m. 51
  s1 |
  % m. 52
  s1 |
  % m. 53
  s1 |
  % m. 54
  s1 |
  % m. 55
  s1 |
  % m. 56
  s1 |
  % m. 57
  s1 |
  % m. 58
  s1 |
  % m. 59
  s1 |
  % m. 60
  s1 |
  % m. 61
  s1 |
  % m. 62
  s1 |
  % m. 63
  s1 |
  % m. 64
  s1 |
  % m. 65
  s1 |
  % m. 66
  s1 |
  % m. 67
  s1 |
  % m. 68
  s1 |
  % m. 69
  s1 |
  % m. 70
  s1 |
  % m. 71
  s1 |
  % m. 72
  s1 |
  % m. 73
  \key b \minor
  s1 |
  % m. 74
  s1 |
  % m. 75
  s1 |
  % m. 76
  s1 |
  % m. 77
  s1 |
  % m. 78
  s1 |
  % m. 79
  s1 |
  % m. 80
  s1 |
  % m. 81
  \key e \minor
  s1 |
  % m. 82
  s1 |
  % m. 83
  s1 |
  % m. 84
  s1 |
  % m. 85
  s1 |
  % m. 86
  s1 |
  % m. 87
  s1 |
  % m. 88
  s1 |
  % m. 89
  \key a \minor
  s1 |
  % m. 90
  s1 |
  % m. 91
  s1 |
  % m. 92
  s1 |
  % m. 93
  s1 |
  % m. 94
  s1 |
  % m. 95
  s1 |
  % m. 96
  s1 |
  % m. 97
  \key c \minor
  s1 |
  % m. 98
  s1 |
  % m. 99
  s1 |
  % m. 100
  s1 |
  % m. 101
  s1 |
  % m. 102
  s1 |
  % m. 103
  s1 |
  % m. 104
  s1 |
  % m. 105
  \key g \major
  s1 |
  % m. 106
  s1 |
  % m. 107
  s1 |
  % m. 108
  s1 |
  % m. 109
  s1 |
  % m. 110
  s1 |
  % m. 111
  s1 |
  % m. 112
  s1 |
  % m. 113
  s1 |
  % m. 114
  s1 |
  % m. 115
  s1 |
  % m. 116
  s1 |
  % m. 117
  s1 |
  % m. 118
  s1 |
  % m. 119
  s1 |
  % m. 120
  s1 |
  % m. 121
  s1 |
  % m. 122
  s1 |
  % m. 123
  s1 |
  % m. 124
  s1 |
  % m. 125
  s1 |
  % m. 126
  s1 |
  % m. 127
  s1 |
  % m. 128
  s1 |
  % m. 129
  s1 |
  % m. 130
  s1 |
  % m. 131
  s1 |
  % m. 132
  s1 |
  % m. 133
  s1 |
  % m. 134
  s1 |
  % m. 135
  s1 |
  % m. 136
  s1 |
  % m. 137
  s1 |
  % m. 138
  s1 |
  % m. 139
  s1 |
  % m. 140
  s1 |
  % m. 141
  s1 |
  % m. 142
  s1 |
  % m. 143
  s1 |
  % m. 144
  s1 |
  % m. 145
  s1 |
  % m. 146
  s1 |
  % m. 147
  s1 |
  % m. 148
  s1 |
  % m. 149
  s1 |
  % m. 150
  s1 |
  % m. 151
  s1 |
  % m. 152
  s1 |
  % m. 153
  s1 |
  % m. 154
  s1 |
  % m. 155
  s1 |
  % m. 156
  s1 |
  % m. 157
  s1 |
  % m. 158
  s1 |
  % m. 159
  s1 |
  % m. 160
  s1 |
  % m. 161
  \key g \major
  s1 |
  % m. 162
  s1 |
  % m. 163
  s1 |
  % m. 164
  s1 |
  % m. 165
  s1 |
  % m. 166
  s1 |
  % m. 167
  s1 |
  % m. 168
  s1 |
  % m. 169
  s1 |
  % m. 170
  s1 |
  % m. 171
  s1 |
  % m. 172
  s1 |
  % m. 173
  s1 |
  % m. 174
  s1 |
  % m. 175
  s1 |
  % m. 176
  s1 |
  % m. 177
  s1 |
  % m. 178
  s1 |
  % m. 179
  s1 |
  % m. 180
  s1 |
  % m. 181
  s1 |
  % m. 182
  s1 |
  % m. 183
  s1 |
  % m. 184
  s1 |
  % m. 185
  s1 |
  % m. 186
  s1 |
  % m. 187
  s1 |
  % m. 188
  s1 |
  % m. 189
  s1 |
  % m. 190
  s1 |
  % m. 191
  s1 |
  % m. 192
  s1 |
  % m. 193
  s1 |
  % m. 194
  s1 |
  % m. 195
  s1 |
  % m. 196
  s1 |
  % m. 197
  s1 |
  % m. 198
  s1 |
  % m. 199
  s1 |
  % m. 200
  s1 |
}
timing = {
  \barNumberCheck #1 \mark \markup \box \small "P · Exposition" \tempo "Andante, quasi una memoria" 4 = 80 s1 | \noBreak
  \barNumberCheck #2 s1 | \noBreak
  \barNumberCheck #3 s1 | \noBreak
  \barNumberCheck #4 s1 | \break
  \barNumberCheck #5 \tempo "Allegro moderato" 4 = 120 s1 | \noBreak
  \barNumberCheck #6 s1 | \noBreak
  \barNumberCheck #7 s1 | \noBreak
  \barNumberCheck #8 s1 | \break
  \barNumberCheck #9 s1 | \noBreak
  \barNumberCheck #10 s1 | \noBreak
  \barNumberCheck #11 s1 | \noBreak
  \barNumberCheck #12 s1 | \break
  \barNumberCheck #13 s1 | \noBreak
  \barNumberCheck #14 s1 | \noBreak
  \barNumberCheck #15 s1 | \noBreak
  \barNumberCheck #16 s1 | \break
  \barNumberCheck #17 s1 | \noBreak
  \barNumberCheck #18 s1 | \noBreak
  \barNumberCheck #19 s1 | \noBreak
  \barNumberCheck #20 s1 | \pageBreak
  \barNumberCheck #21 s1 | \noBreak
  \barNumberCheck #22 s1 | \noBreak
  \barNumberCheck #23 s1 | \noBreak
  \barNumberCheck #24 s1 | \break
  \barNumberCheck #25 \mark \markup \box \small "TR" s1 | \noBreak
  \barNumberCheck #26 s1 | \noBreak
  \barNumberCheck #27 s1 | \noBreak
  \barNumberCheck #28 s1 | \break
  \barNumberCheck #29 s1 | \noBreak
  \barNumberCheck #30 s1 | \noBreak
  \barNumberCheck #31 s1 | \noBreak
  \barNumberCheck #32 s1 | \break
  \barNumberCheck #33 s1 | \noBreak
  \barNumberCheck #34 s1 | \noBreak
  \barNumberCheck #35 s1 | \noBreak
  \barNumberCheck #36 s1 | \break
  \barNumberCheck #37 s1 | \noBreak
  \barNumberCheck #38 s1 | \noBreak
  \barNumberCheck #39 s1 | \noBreak
  \barNumberCheck #40 s1 | \pageBreak
  \barNumberCheck #41 \mark \markup \box \small "S · D major" \tempo "Cantabile, poco meno mosso" 4 = 100 s1 | \noBreak
  \barNumberCheck #42 s1 | \noBreak
  \barNumberCheck #43 s1 | \noBreak
  \barNumberCheck #44 s1 | \break
  \barNumberCheck #45 s1 | \noBreak
  \barNumberCheck #46 s1 | \noBreak
  \barNumberCheck #47 s1 | \noBreak
  \barNumberCheck #48 s1 | \break
  \barNumberCheck #49 s1 | \noBreak
  \barNumberCheck #50 s1 | \noBreak
  \barNumberCheck #51 s1 | \noBreak
  \barNumberCheck #52 s1 | \break
  \barNumberCheck #53 s1 | \noBreak
  \barNumberCheck #54 s1 | \noBreak
  \barNumberCheck #55 s1 | \noBreak
  \barNumberCheck #56 s1 | \break
  \barNumberCheck #57 s1 | \noBreak
  \barNumberCheck #58 s1 | \noBreak
  \barNumberCheck #59 s1 | \noBreak
  \barNumberCheck #60 s1 | \pageBreak
  \barNumberCheck #61 s1 | \noBreak
  \barNumberCheck #62 s1 | \noBreak
  \barNumberCheck #63 s1 | \noBreak
  \barNumberCheck #64 s1 | \break
  \barNumberCheck #65 \mark \markup \box \small "Closing" \tempo "Tempo I" 4 = 120 s1 | \noBreak
  \barNumberCheck #66 s1 | \noBreak
  \barNumberCheck #67 s1 | \noBreak
  \barNumberCheck #68 s1 | \break
  \barNumberCheck #69 s1 | \noBreak
  \barNumberCheck #70 s1 | \noBreak
  \barNumberCheck #71 s1 | \noBreak
  \barNumberCheck #72 s1 | \break
  \barNumberCheck #73 \mark \markup \box \small "Development" \tempo "Agitato" 4 = 120 s1 | \noBreak
  \barNumberCheck #74 s1 | \noBreak
  \barNumberCheck #75 s1 | \noBreak
  \barNumberCheck #76 s1 | \break
  \barNumberCheck #77 s1 | \noBreak
  \barNumberCheck #78 s1 | \noBreak
  \barNumberCheck #79 s1 | \noBreak
  \barNumberCheck #80 s1 | \pageBreak
  \barNumberCheck #81 s1 | \noBreak
  \barNumberCheck #82 s1 | \noBreak
  \barNumberCheck #83 s1 | \noBreak
  \barNumberCheck #84 s1 | \break
  \barNumberCheck #85 s1 | \noBreak
  \barNumberCheck #86 s1 | \noBreak
  \barNumberCheck #87 s1 | \noBreak
  \barNumberCheck #88 s1 | \break
  \barNumberCheck #89 \mark \markup \box \small "Inversion" s1 | \noBreak
  \barNumberCheck #90 s1 | \noBreak
  \barNumberCheck #91 s1 | \noBreak
  \barNumberCheck #92 s1 | \break
  \barNumberCheck #93 s1 | \noBreak
  \barNumberCheck #94 s1 | \noBreak
  \barNumberCheck #95 s1 | \noBreak
  \barNumberCheck #96 s1 | \break
  \barNumberCheck #97 s1 | \noBreak
  \barNumberCheck #98 s1 | \noBreak
  \barNumberCheck #99 s1 | \noBreak
  \barNumberCheck #100 s1 | \pageBreak
  \barNumberCheck #101 s1 | \noBreak
  \barNumberCheck #102 s1 | \noBreak
  \barNumberCheck #103 s1 | \noBreak
  \barNumberCheck #104 s1 | \break
  \barNumberCheck #105 \mark \markup \box \small "Retransition" \tempo "Con fuoco" 4 = 120 s1 | \noBreak
  \barNumberCheck #106 s1 | \noBreak
  \barNumberCheck #107 s1 | \noBreak
  \barNumberCheck #108 s1 | \break
  \barNumberCheck #109 s1 | \noBreak
  \barNumberCheck #110 s1 | \noBreak
  \barNumberCheck #111 s1 | \noBreak
  \barNumberCheck #112 s1 | \break
  \barNumberCheck #113 \tempo "Poco a poco tranquillo" 4 = 100 s1 | \noBreak
  \barNumberCheck #114 s1 | \noBreak
  \barNumberCheck #115 s1 | \noBreak
  \barNumberCheck #116 s1 | \break
  \barNumberCheck #117 \tempo "Meno mosso" 4 = 80 s1 | \noBreak
  \barNumberCheck #118 s1 | \noBreak
  \barNumberCheck #119 s1 | \noBreak
  \barNumberCheck #120 \tempo "Sospeso" 4 = 60 s1 | \pageBreak
  \barNumberCheck #121 \mark \markup \box \small "Recapitulation" \tempo "Tempo I, dolce" 4 = 120 s1 | \noBreak
  \barNumberCheck #122 s1 | \noBreak
  \barNumberCheck #123 s1 | \noBreak
  \barNumberCheck #124 s1 | \break
  \barNumberCheck #125 s1 | \noBreak
  \barNumberCheck #126 s1 | \noBreak
  \barNumberCheck #127 s1 | \noBreak
  \barNumberCheck #128 s1 | \break
  \barNumberCheck #129 s1 | \noBreak
  \barNumberCheck #130 s1 | \noBreak
  \barNumberCheck #131 s1 | \noBreak
  \barNumberCheck #132 s1 | \break
  \barNumberCheck #133 s1 | \noBreak
  \barNumberCheck #134 s1 | \noBreak
  \barNumberCheck #135 s1 | \noBreak
  \barNumberCheck #136 s1 | \break
  \barNumberCheck #137 s1 | \noBreak
  \barNumberCheck #138 s1 | \noBreak
  \barNumberCheck #139 s1 | \noBreak
  \barNumberCheck #140 s1 | \pageBreak
  \barNumberCheck #141 s1 | \noBreak
  \barNumberCheck #142 s1 | \noBreak
  \barNumberCheck #143 s1 | \noBreak
  \barNumberCheck #144 s1 | \break
  \barNumberCheck #145 \mark \markup \box \small "TR · recomposed" s1 | \noBreak
  \barNumberCheck #146 s1 | \noBreak
  \barNumberCheck #147 s1 | \noBreak
  \barNumberCheck #148 s1 | \break
  \barNumberCheck #149 s1 | \noBreak
  \barNumberCheck #150 s1 | \noBreak
  \barNumberCheck #151 s1 | \noBreak
  \barNumberCheck #152 s1 | \break
  \barNumberCheck #153 s1 | \noBreak
  \barNumberCheck #154 s1 | \noBreak
  \barNumberCheck #155 s1 | \noBreak
  \barNumberCheck #156 s1 | \break
  \barNumberCheck #157 s1 | \noBreak
  \barNumberCheck #158 s1 | \noBreak
  \barNumberCheck #159 s1 | \noBreak
  \barNumberCheck #160 s1 | \pageBreak
  \barNumberCheck #161 \mark \markup \box \small "S · G major" \tempo "Cantabile" 4 = 100 s1 | \noBreak
  \barNumberCheck #162 s1 | \noBreak
  \barNumberCheck #163 s1 | \noBreak
  \barNumberCheck #164 s1 | \break
  \barNumberCheck #165 s1 | \noBreak
  \barNumberCheck #166 s1 | \noBreak
  \barNumberCheck #167 s1 | \noBreak
  \barNumberCheck #168 s1 | \break
  \barNumberCheck #169 s1 | \noBreak
  \barNumberCheck #170 s1 | \noBreak
  \barNumberCheck #171 s1 | \noBreak
  \barNumberCheck #172 s1 | \break
  \barNumberCheck #173 s1 | \noBreak
  \barNumberCheck #174 s1 | \noBreak
  \barNumberCheck #175 s1 | \noBreak
  \barNumberCheck #176 s1 | \break
  \barNumberCheck #177 s1 | \noBreak
  \barNumberCheck #178 s1 | \noBreak
  \barNumberCheck #179 s1 | \noBreak
  \barNumberCheck #180 s1 | \pageBreak
  \barNumberCheck #181 s1 | \noBreak
  \barNumberCheck #182 s1 | \noBreak
  \barNumberCheck #183 s1 | \noBreak
  \barNumberCheck #184 s1 | \break
  \barNumberCheck #185 \mark \markup \box \small "Closing" \tempo "Tempo I" 4 = 120 s1 | \noBreak
  \barNumberCheck #186 s1 | \noBreak
  \barNumberCheck #187 s1 | \noBreak
  \barNumberCheck #188 s1 | \break
  \barNumberCheck #189 s1 | \noBreak
  \barNumberCheck #190 s1 | \noBreak
  \barNumberCheck #191 s1 | \noBreak
  \barNumberCheck #192 s1 | \break
  \barNumberCheck #193 \mark \markup \box \small "Coda" \tempo "La memoria" 4 = 80 s1 | \noBreak
  \barNumberCheck #194 s1 | \noBreak
  \barNumberCheck #195 \tempo "Animando" 4 = 100 s1 | \noBreak
  \barNumberCheck #196 s1 | \break
  \barNumberCheck #197 \tempo "Risoluto" 4 = 120 s1 | \noBreak
  \barNumberCheck #198 s1 | \noBreak
  \barNumberCheck #199 \tempo "Allargando" 4 = 80 s1 | \noBreak
  \barNumberCheck #200 \tempo "Largo" 4 = 60 s1 | \pageBreak
}
rh = {
  % m. 1: P; G
  \barNumberCheck #1 << { \relative c'' { r4. e8( d e c b) } } { s1\p\<^\markup \italic "Singing tone; light pedal, clear at each harmony" } >> |
  % m. 2: P; D7
  \barNumberCheck #2 << { \relative c'' { a2 a8.( b16) g8( g16 a) } } { s1 } >> |
  % m. 3: P; G
  \barNumberCheck #3 << { \relative c'' { b4.( d8) e8( d) e16( d e g) } } { s1\mp\! } >> |
  % m. 4: P; D7
  \barNumberCheck #4 << { \relative c'' { d8.( b16) d8( d16 b) a8( e') d16( e g a) } } { s1 } >> |
  % m. 5: P; Em
  \barNumberCheck #5 << { \transpose c c' { \relative c'' { g4( fis8 e) d4( b8 a) } } } { s1\mp } >> |
  % m. 6: P; C
  \barNumberCheck #6 << { \relative c'' { g8( a b c) d4( e8 c) } } { s1 } >> |
  % m. 7: P; D7
  \barNumberCheck #7 << { \relative c'' { b4( a) g8( e' d c) } } { s1 } >> |
  % m. 8: P; G
  \barNumberCheck #8 << { \relative c'' { b4( a8 fis) g2 } } { s1 } >> |
  % m. 9: P; G
  \barNumberCheck #9 << { \relative c'' { e8( d e c) b4( d8 g) } } { s1\mf\< } >> |
  % m. 10: P; D7
  \barNumberCheck #10 << { \relative c'' { fis8( e fis d) c4( a8 d) } } { s1 } >> |
  % m. 11: P; G
  \barNumberCheck #11 << { \relative c'' { b8( d g fis) e( d c b) } } { s1 } >> |
  % m. 12: P; D
  \barNumberCheck #12 << { \relative c'' { a4( b8 c) d2 } } { s1 } >> |
  % m. 13: P; C
  \barNumberCheck #13 << { \relative c'' { e8( d e c) b( c d e) } } { s1 } >> |
  % m. 14: P; D/F#
  \barNumberCheck #14 << { \relative c'' { fis8( e fis d) c( b a g) } } { s1 } >> |
  % m. 15: P; A7
  \barNumberCheck #15 << { \relative c'' { a8( b c d) e4( cis8 a) } } { s1 } >> |
  % m. 16: P; D
  \barNumberCheck #16 << { \relative c'' { <a d fis>2 r4 d8( c) } } { s1 } >> |
  % m. 17: P; G
  \barNumberCheck #17 << { \relative c'' { b8( d g a) b4( a8 g) } } { s1\f\! } >> |
  % m. 18: P; D/F#
  \barNumberCheck #18 << { \transpose c c' { \relative c'' { a8( fis d c) b4( a) } } } { s1 } >> |
  % m. 19: P; Em
  \barNumberCheck #19 << { \relative c'' { g8( b e fis) g4( fis8 e) } } { s1 } >> |
  % m. 20: P; B7
  \barNumberCheck #20 << { \relative c'' { fis8( dis b a) g4( fis) } } { s1 } >> |
  % m. 21: P; C
  \barNumberCheck #21 << { \transpose c c, { \relative c'' { e8( g c d) e4( d8 c) } } } { s1\> } >> |
  % m. 22: P; Am/C
  \barNumberCheck #22 << { \relative c'' { b8( a g fis) e4( c') } } { s1 } >> |
  % m. 23: P; D7
  \barNumberCheck #23 << { \relative c'' { b4( a8 g) fis8( e d fis) } } { s1 } >> |
  % m. 24: P; G
  \barNumberCheck #24 << { \relative c'' { <g b g'>2 r2 } } { s1\p\! } >> |
  % m. 25: TR; Em
  \barNumberCheck #25 << { \relative c'' { e16( d e c b c d e) g8-. g-. fis-. e-. } } { s1\mf\< } >> |
  % m. 26: TR; D/F#
  \barNumberCheck #26 << { \relative c'' { fis16( e fis d c d e fis) a8-. a-. g-. fis-. } } { s1 } >> |
  % m. 27: TR; G
  \barNumberCheck #27 << { \relative c'' { g16( fis g e d e fis g) b8-. b-. a-. g-. } } { s1 } >> |
  % m. 28: TR; F#7
  \barNumberCheck #28 << { \relative c'' { ais8( b cis b) ais4( fis) } } { s1 } >> |
  % m. 29: TR; Bm
  \barNumberCheck #29 << { \relative c'' { b16( a b g fis g a b) d8-. cis-. b-. a-. } } { s1\f\! } >> |
  % m. 30: TR; E7
  \barNumberCheck #30 << { \relative c'' { gis8( a b a) gis4( e) } } { s1 } >> |
  % m. 31: TR; A
  \barNumberCheck #31 << { \relative c'' { a16( g a fis e fis g a) cis8-. b-. a-. g-. } } { s1 } >> |
  % m. 32: TR; D
  \barNumberCheck #32 << { \relative c'' { fis4( e8 cis) d4 r4 } } { s1 } >> |
  % m. 33: TR; A/C#
  \barNumberCheck #33 << { \relative c'' { fis8( e fis d) cis8( e a g) } } { s1\f\< } >> |
  % m. 34: TR; D
  \barNumberCheck #34 << { \relative c'' { fis8( a d cis) b4( a8 g) } } { s1 } >> |
  % m. 35: TR; Bm
  \barNumberCheck #35 << { \relative c'' { fis8( e d fis) e4( d8 b) } } { s1 } >> |
  % m. 36: TR; A7
  \barNumberCheck #36 << { \relative c'' { cis8( b a cis) e4( g8 e) } } { s1 } >> |
  % m. 37: TR; A7
  \barNumberCheck #37 << { \transpose c c' { \relative c'' { <a, cis e>4-> r8 e'8 <a, cis e>4-> r8 e'8 } } } { s1\ff\! } >> |
  % m. 38: TR; A7
  \barNumberCheck #38 << { \transpose c c' { \relative c'' { g8( fis e d) cis4( b8 a) } } } { s1 } >> |
  % m. 39: TR; A7
  \barNumberCheck #39 << { \relative c'' { <a cis e>4 <b d e> <cis e a> <b d gis> } } { s1 } >> |
  % m. 40: TR; A
  \barNumberCheck #40 << { \relative c'' { <cis e a>2 r2 } } { s1\p } >> |
  % m. 41: S; D
  \barNumberCheck #41 << { \transpose c c, { \relative c'' { fis'2( e4 d) } } } { s1\p\< } >> |
  % m. 42: S; A/C#
  \barNumberCheck #42 << { \relative c'' { e4.( fis8) cis2 } } { s1 } >> |
  % m. 43: S; Bm
  \barNumberCheck #43 << { \relative c'' { d4( fis8 a) g4( fis8 e) } } { s1 } >> |
  % m. 44: S; F#m
  \barNumberCheck #44 << { \relative c'' { fis2( e4) r4 } } { s1 } >> |
  % m. 45: S; G
  \barNumberCheck #45 << { \transpose c c' { \relative c'' { g4.( fis8) e4( d) } } } { s1\> } >> |
  % m. 46: S; Em
  \barNumberCheck #46 << { \relative c'' { cis8( d e fis) g4( e) } } { s1 } >> |
  % m. 47: S; A7
  \barNumberCheck #47 << { \relative c'' { fis4( e8 d) cis4( b8 cis) } } { s1 } >> |
  % m. 48: S; D
  \barNumberCheck #48 << { \transpose c c, { \relative c'' { fis'2. r4 } } } { s1\! } >> |
  % m. 49: S; D
  \barNumberCheck #49 << { \relative c'' { a'2( g4 fis) } } { s1\mp\< } >> |
  % m. 50: S; A/C#
  \barNumberCheck #50 << { \transpose c c' { \relative c'' { g4.( a8) e2 } } } { s1 } >> |
  % m. 51: S; Bm
  \barNumberCheck #51 << { \relative c'' { fis8( e d fis) b4( a8 g) } } { s1 } >> |
  % m. 52: S; D/A
  \barNumberCheck #52 << { \transpose c c' { \relative c'' { a4( fis8 d) cis2 } } } { s1 } >> |
  % m. 53: S; G
  \barNumberCheck #53 << { \relative c'' { b8( cis d e) fis4( g8 fis) } } { s1\mf\! } >> |
  % m. 54: S; Em
  \barNumberCheck #54 << { \relative c'' { e4( g8 fis) e4( d8 b) } } { s1 } >> |
  % m. 55: S; A7
  \barNumberCheck #55 << { \relative c'' { cis4( d8 e) <g, cis e>4( <a cis e>) } } { s1 } >> |
  % m. 56: S; Bm
  \barNumberCheck #56 << { \relative c'' { <b d fis>2 r4 fis'8( e) } } { s1\p } >> |
  % m. 57: S; Bm
  \barNumberCheck #57 << { \transpose c c' { \relative c'' { d4( cis8 b) a4( fis8 d) } } } { s1\mp\< } >> |
  % m. 58: S; Em
  \barNumberCheck #58 << { \relative c'' { e8( fis g a) b4( g8 e) } } { s1 } >> |
  % m. 59: S; D
  \barNumberCheck #59 << { \relative c'' { fis4( g8 a) d4( cis8 b) } } { s1 } >> |
  % m. 60: S; F#m
  \barNumberCheck #60 << { \transpose c c' { \relative c'' { a8( g fis e) d4( fis8 a) } } } { s1 } >> |
  % m. 61: S; G
  \barNumberCheck #61 << { \transpose c c' { \relative c'' { b4( a8 g) fis4( e8 d) } } } { s1\f\! } >> |
  % m. 62: S; Em
  \barNumberCheck #62 << { \relative c'' { e4( fis8 g) <g b e>2 } } { s1 } >> |
  % m. 63: S; A7
  \barNumberCheck #63 << { \relative c'' { <fis a d>2 <e g cis>4( <e g a>) } } { s1 } >> |
  % m. 64: S; D
  \barNumberCheck #64 << { \relative c'' { <fis a d>1 } } { s1\mf } >> |
  % m. 65: C; D
  \barNumberCheck #65 << { \relative c'' { d8-. fis-. a-. d-. cis( b a g) } } { s1\f } >> |
  % m. 66: C; A7
  \barNumberCheck #66 << { \relative c'' { fis8( e fis d) cis4( a) } } { s1 } >> |
  % m. 67: C; G
  \barNumberCheck #67 << { \relative c'' { b8-. d-. g-. b-. a( g fis e) } } { s1 } >> |
  % m. 68: C; A7
  \barNumberCheck #68 << { \relative c'' { <e g a>2 <cis e a>2 } } { s1 } >> |
  % m. 69: C; D
  \barNumberCheck #69 << { \relative c'' { fis8( e fis d) a4( cis8 e) } } { s1\mp\> } >> |
  % m. 70: C; D/A
  \barNumberCheck #70 << { \relative c'' { d8( cis d b) a4( fis) } } { s1 } >> |
  % m. 71: C; A7
  \barNumberCheck #71 << { \relative c'' { <g a cis>2 <e g a>2 } } { s1 } >> |
  % m. 72: C; D
  \barNumberCheck #72 << { \transpose c c, { \relative c'' { <fis a d>2 r2 } } } { s1\p\! } >> |
  % m. 73: DEV; Bm
  \barNumberCheck #73 << { \relative c'' { g'8( fis g e) d4( fis8 b) } } { s1\p\< } >> |
  % m. 74: DEV; F#7
  \barNumberCheck #74 << { \transpose c c' { \relative c'' { ais8( gis ais fis) e4( cis8 ais) } } } { s1 } >> |
  % m. 75: DEV; Bm
  \barNumberCheck #75 << { \relative c'' { b8( cis d e) fis4( e8 d) } } { s1 } >> |
  % m. 76: DEV; F#7
  \barNumberCheck #76 << { \relative c'' { cis4( b8 ais) b4 r4 } } { s1 } >> |
  % m. 77: DEV; Bm
  \barNumberCheck #77 << { \transpose c c, { \relative c'' { fis'4( e8 d) cis4( d8 e) } } } { s1\mp\!^\markup \italic "Bass cantabile" } >> |
  % m. 78: DEV; B7
  \barNumberCheck #78 << { \relative c'' { dis4( fis8 a) g4( fis8 e) } } { s1 } >> |
  % m. 79: DEV; Em
  \barNumberCheck #79 << { \relative c'' { e4( fis8 g) a4( g8 fis) } } { s1 } >> |
  % m. 80: DEV; B7
  \barNumberCheck #80 << { \relative c'' { fis4( e8 dis) e2 } } { s1 } >> |
  % m. 81: DEV; Em
  \barNumberCheck #81 << { \relative c'' { c'8( b c a) g4( b8 e) } } { s1\mf\< } >> |
  % m. 82: DEV; B7
  \barNumberCheck #82 << { \transpose c c' { \relative c'' { dis8( cis dis b) a4( fis8 dis) } } } { s1 } >> |
  % m. 83: DEV; Em
  \barNumberCheck #83 << { \relative c'' { e8( fis g a) b4( a8 g) } } { s1 } >> |
  % m. 84: DEV; B7
  \barNumberCheck #84 << { \relative c'' { fis4( e8 dis) e4 r4 } } { s1 } >> |
  % m. 85: DEV; Em
  \barNumberCheck #85 << { \relative c'' { b'4( a8 g) fis4( g8 a) } } { s1\f\! } >> |
  % m. 86: DEV; E7
  \barNumberCheck #86 << { \transpose c c' { \relative c'' { gis4( b8 d) c4( b8 a) } } } { s1 } >> |
  % m. 87: DEV; Am
  \barNumberCheck #87 << { \transpose c c' { \relative c'' { a4( b8 c) d4( c8 b) } } } { s1^\markup \italic "l.h. may take the inner notes" } >> |
  % m. 88: DEV; E7
  \barNumberCheck #88 << { \transpose c c' { \relative c'' { b4( a8 gis) a2 } } } { s1 } >> |
  % m. 89: DEV; Am
  \barNumberCheck #89 << { \relative c'' { a8( b a c) d4( c8 b) } } { s1\p\< } >> |
  % m. 90: DEV; F
  \barNumberCheck #90 << { \relative c'' { c8( d c e) f4( e8 d) } } { s1 } >> |
  % m. 91: DEV; G7
  \barNumberCheck #91 << { \relative c'' { b8( c b d) e4( d8 c) } } { s1 } >> |
  % m. 92: DEV; C
  \barNumberCheck #92 << { \relative c'' { c8( d c e) f4( e8 d) } } { s1 } >> |
  % m. 93: DEV; Dm
  \barNumberCheck #93 << { \relative c'' { d16( e f g a g f e) d8( a' f d) } } { s1\mf } >> |
  % m. 94: DEV; Em
  \barNumberCheck #94 << { \relative c'' { e16( fis g a b a g fis) e8( b' g e) } } { s1 } >> |
  % m. 95: DEV; F
  \barNumberCheck #95 << { \relative c'' { f16( g a bes c bes a g) f8( c' a f) } } { s1 } >> |
  % m. 96: DEV; Cm
  \barNumberCheck #96 << { \transpose c c' { \relative c'' { g8( f ees d) c4( bes8 aes) } } } { s1 } >> |
  % m. 97: DEV; Ab
  \barNumberCheck #97 << { \relative c'' { g8( aes bes c) ees4( d8 c) } } { s1\f\! } >> |
  % m. 98: DEV; Bb
  \barNumberCheck #98 << { \relative c'' { bes8( c d ees) f4( ees8 d) } } { s1 } >> |
  % m. 99: DEV; Cm
  \barNumberCheck #99 << { \relative c'' { c8( d ees f) g4( f8 ees) } } { s1 } >> |
  % m. 100: DEV; Bb
  \barNumberCheck #100 << { \relative c'' { d4( ees8 f) bes4( aes8 g) } } { s1 } >> |
  % m. 101: DEV; Eb
  \barNumberCheck #101 << { \relative c'' { ees8( f g aes) bes4( aes8 g) } } { s1\ff\< } >> |
  % m. 102: DEV; D7
  \barNumberCheck #102 << { \relative c'' { fis16( g a bes c bes a g) fis8( d fis a) } } { s1 } >> |
  % m. 103: DEV; Gm
  \barNumberCheck #103 << { \transpose c c' { \relative c'' { bes8( a g fis) g4( bes8 d) } } } { s1 } >> |
  % m. 104: DEV; A7b9
  \barNumberCheck #104 << { \transpose c c' { \relative c'' { <ees, g bes>4-> <e g bes>4-> <cis e g bes>2-> } } } { s1 } >> |
  % m. 105: RT; A7b9
  \barNumberCheck #105 << { \relative c'' { <e g bes cis>4-> <e g bes cis>8-. <e g bes cis>-. <e g bes cis>4-> r4 } } { s1\ff\! } >> |
  % m. 106: RT; Ger6
  \barNumberCheck #106 << { \relative c'' { <ees g bes cis>2-> <ees g bes cis>4 r4 } } { s1 } >> |
  % m. 107: RT; G/D
  \barNumberCheck #107 << { \relative c'' { <d g b>2 <cis e g>2 } } { s1 } >> |
  % m. 108: RT; D7
  \barNumberCheck #108 << { \relative c'' { <c fis a>2 r4 a'8( g) } } { s1 } >> |
  % m. 109: RT; D7
  \barNumberCheck #109 << { \relative c'' { fis8( e fis d) c4( a) } } { s1\f\> } >> |
  % m. 110: RT; G/D
  \barNumberCheck #110 << { \relative c'' { g'8( fis g e) d4( b) } } { s1 } >> |
  % m. 111: RT; D7
  \barNumberCheck #111 << { \transpose c c, { \relative c'' { fis'8( e fis d) c4( a) } } } { s1 } >> |
  % m. 112: RT; G/D
  \barNumberCheck #112 << { \transpose c c, { \relative c'' { e'8( d e c) b4( g) } } } { s1 } >> |
  % m. 113: RT; D7
  \barNumberCheck #113 << { \transpose c c, { \relative c'' { fis'4( e) d( c) } } } { s1\mp } >> |
  % m. 114: RT; G/D
  \barNumberCheck #114 << { \relative c'' { b4( a) g( fis) } } { s1 } >> |
  % m. 115: RT; D7
  \barNumberCheck #115 << { \transpose c c, { \relative c'' { e'4( d) c( b) } } } { s1 } >> |
  % m. 116: RT; D7
  \barNumberCheck #116 << { \relative c'' { a4( g) fis( e) } } { s1 } >> |
  % m. 117: RT; D7
  \barNumberCheck #117 << { \transpose c c, { \relative c'' { d8( e fis g) a4( c) } } } { s1\p } >> |
  % m. 118: RT; A7
  \barNumberCheck #118 << { \relative c'' { b8( a g fis) e4( cis') } } { s1 } >> |
  % m. 119: RT; D7
  \barNumberCheck #119 << { \relative c'' { d4( c8 a) fis'4( e8 c) } } { s1 } >> |
  % m. 120: RT; D7
  \barNumberCheck #120 << { \relative c'' { a2 r2 } } { s1\pp\! } >> |
  % m. 121: RECAP-P; G
  \barNumberCheck #121 << { \relative c'' { r4. e8( d e c b) } } { s1\mp\< } >> |
  % m. 122: RECAP-P; D7
  \barNumberCheck #122 << { \relative c'' { a2 a8.( b16) g8( g16 a) } } { s1 } >> |
  % m. 123: RECAP-P; G
  \barNumberCheck #123 << { \relative c'' { b4.( d8) e8( d) e16( d e g) } } { s1 } >> |
  % m. 124: RECAP-P; D7
  \barNumberCheck #124 << { \relative c'' { d8.( b16) d8( d16 b) a8( e') d16( e g a) } } { s1 } >> |
  % m. 125: RECAP-P; Em
  \barNumberCheck #125 << { \transpose c c' { \relative c'' { g4( fis8 e) d4( b8 a) } } } { s1\mf\! } >> |
  % m. 126: RECAP-P; C
  \barNumberCheck #126 << { \relative c'' { g8( a b c) d4( e8 c) } } { s1 } >> |
  % m. 127: RECAP-P; D7
  \barNumberCheck #127 << { \relative c'' { b4( a) g8( e' d c) } } { s1 } >> |
  % m. 128: RECAP-P; G
  \barNumberCheck #128 << { \relative c'' { b4( a8 fis) g2 } } { s1 } >> |
  % m. 129: RECAP-P; G
  \barNumberCheck #129 << { \relative c'' { e8( d e c) b4( d8 g) } } { s1\f\< } >> |
  % m. 130: RECAP-P; D7
  \barNumberCheck #130 << { \relative c'' { fis8( e fis d) c4( a8 d) } } { s1 } >> |
  % m. 131: RECAP-P; G
  \barNumberCheck #131 << { \relative c'' { b8( d g fis) e( d c b) } } { s1 } >> |
  % m. 132: RECAP-P; D
  \barNumberCheck #132 << { \relative c'' { a4( b8 c) d2 } } { s1 } >> |
  % m. 133: RECAP-P; C
  \barNumberCheck #133 << { \relative c'' { e8( d e c) b( c d e) } } { s1 } >> |
  % m. 134: RECAP-P; D/F#
  \barNumberCheck #134 << { \relative c'' { fis8( e fis d) c( b a g) } } { s1 } >> |
  % m. 135: RECAP-P; A7
  \barNumberCheck #135 << { \relative c'' { a8( b c d) e4( cis8 a) } } { s1 } >> |
  % m. 136: RECAP-P; D
  \barNumberCheck #136 << { \relative c'' { <a d fis>2 r4 d8( c) } } { s1 } >> |
  % m. 137: RECAP-P; G
  \barNumberCheck #137 << { \relative c'' { b8( d g a) b4( a8 g) } } { s1\ff\! } >> |
  % m. 138: RECAP-P; D/F#
  \barNumberCheck #138 << { \transpose c c' { \relative c'' { a8( fis d c) b4( a) } } } { s1 } >> |
  % m. 139: RECAP-P; Em
  \barNumberCheck #139 << { \relative c'' { g8( b e fis) g4( fis8 e) } } { s1 } >> |
  % m. 140: RECAP-P; B7
  \barNumberCheck #140 << { \relative c'' { fis8( dis b a) g4( fis) } } { s1 } >> |
  % m. 141: RECAP-P; C
  \barNumberCheck #141 << { \transpose c c, { \relative c'' { e8( g c d) e4( d8 c) } } } { s1\> } >> |
  % m. 142: RECAP-P; Am/C
  \barNumberCheck #142 << { \relative c'' { b8( a g fis) e4( c') } } { s1 } >> |
  % m. 143: RECAP-P; D7
  \barNumberCheck #143 << { \relative c'' { b4( a8 g) fis8( e d fis) } } { s1 } >> |
  % m. 144: RECAP-P; G
  \barNumberCheck #144 << { \relative c'' { <g b g'>2 r2 } } { s1\p\! } >> |
  % m. 145: RECAP-TR; G
  \barNumberCheck #145 << { \relative c'' { e16( d e c b c d e) g8-. g-. fis-. e-. } } { s1\mf\< } >> |
  % m. 146: RECAP-TR; D/F#
  \barNumberCheck #146 << { \relative c'' { d16( c d b a b c d) fis8-. fis-. e-. d-. } } { s1 } >> |
  % m. 147: RECAP-TR; Am
  \barNumberCheck #147 << { \relative c'' { c16( b c a g a b c) e8-. e-. d-. c-. } } { s1 } >> |
  % m. 148: RECAP-TR; B7
  \barNumberCheck #148 << { \relative c'' { dis8( e fis e) dis4( b) } } { s1 } >> |
  % m. 149: RECAP-TR; Em
  \barNumberCheck #149 << { \relative c'' { e16( d e c b c d e) g8-. fis-. e-. d-. } } { s1\f\! } >> |
  % m. 150: RECAP-TR; A7
  \barNumberCheck #150 << { \relative c'' { cis8( d e d) cis4( a) } } { s1 } >> |
  % m. 151: RECAP-TR; D
  \barNumberCheck #151 << { \relative c'' { d16( c d b a b c d) fis8-. e-. d-. c-. } } { s1 } >> |
  % m. 152: RECAP-TR; G
  \barNumberCheck #152 << { \relative c'' { b4( a8 fis) g4 r4 } } { s1 } >> |
  % m. 153: RECAP-TR; D/F#
  \barNumberCheck #153 << { \relative c'' { b8( a b g) fis( a d c) } } { s1\f\< } >> |
  % m. 154: RECAP-TR; G
  \barNumberCheck #154 << { \relative c'' { b8( d g fis) e4( d8 c) } } { s1 } >> |
  % m. 155: RECAP-TR; Em
  \barNumberCheck #155 << { \relative c'' { b8( a g b) a4( g8 e) } } { s1 } >> |
  % m. 156: RECAP-TR; D7
  \barNumberCheck #156 << { \transpose c c, { \relative c'' { fis8( e d fis) a4( c8 a) } } } { s1 } >> |
  % m. 157: RECAP-TR; D7
  \barNumberCheck #157 << { \relative c'' { <a c d>4-> r8 a8 <a c d>4-> r8 a8 } } { s1\ff\! } >> |
  % m. 158: RECAP-TR; D7
  \barNumberCheck #158 << { \relative c'' { c8( b a g) fis4( e8 d) } } { s1 } >> |
  % m. 159: RECAP-TR; D7
  \barNumberCheck #159 << { \transpose c c, { \relative c'' { <fis a d>4 <g b d> <a c fis> <g c e> } } } { s1 } >> |
  % m. 160: RECAP-TR; D
  \barNumberCheck #160 << { \transpose c c, { \relative c'' { <fis a d>2 r2 } } } { s1\p } >> |
  % m. 161: RECAP-S; D (transposed)
  \barNumberCheck #161 << { \transpose d' g { \transpose c c, { \relative c'' { fis'2( e4 d) } } } } { s1\p\< } >> |
  % m. 162: RECAP-S; A/C# (transposed)
  \barNumberCheck #162 << { \transpose d' g { \relative c'' { e4.( fis8) cis2 } } } { s1 } >> |
  % m. 163: RECAP-S; Bm (transposed)
  \barNumberCheck #163 << { \transpose d' g { \relative c'' { d4( fis8 a) g4( fis8 e) } } } { s1 } >> |
  % m. 164: RECAP-S; F#m (transposed)
  \barNumberCheck #164 << { \transpose d' g { \relative c'' { fis2( e4) r4 } } } { s1 } >> |
  % m. 165: RECAP-S; G (transposed)
  \barNumberCheck #165 << { \transpose d' g { \transpose c c' { \relative c'' { g4.( fis8) e4( d) } } } } { s1\> } >> |
  % m. 166: RECAP-S; Em (transposed)
  \barNumberCheck #166 << { \transpose d' g { \relative c'' { cis8( d e fis) g4( e) } } } { s1 } >> |
  % m. 167: RECAP-S; A7 (transposed)
  \barNumberCheck #167 << { \transpose d' g { \relative c'' { fis4( e8 d) cis4( b8 cis) } } } { s1 } >> |
  % m. 168: RECAP-S; D (transposed)
  \barNumberCheck #168 << { \transpose d' g { \transpose c c, { \relative c'' { fis'2. r4 } } } } { s1\! } >> |
  % m. 169: RECAP-S; D (transposed)
  \barNumberCheck #169 << { \transpose d' g { \relative c'' { a'2( g4 fis) } } } { s1\mp\< } >> |
  % m. 170: RECAP-S; A/C# (transposed)
  \barNumberCheck #170 << { \transpose d' g { \transpose c c' { \relative c'' { g4.( a8) e2 } } } } { s1 } >> |
  % m. 171: RECAP-S; Bm (transposed)
  \barNumberCheck #171 << { \transpose d' g { \relative c'' { fis8( e d fis) b4( a8 g) } } } { s1 } >> |
  % m. 172: RECAP-S; D/A (transposed)
  \barNumberCheck #172 << { \transpose d' g { \transpose c c' { \relative c'' { a4( fis8 d) cis2 } } } } { s1 } >> |
  % m. 173: RECAP-S; G (transposed)
  \barNumberCheck #173 << { \transpose d' g { \relative c'' { b8( cis d e) fis4( g8 fis) } } } { s1\mf\! } >> |
  % m. 174: RECAP-S; Em (transposed)
  \barNumberCheck #174 << { \transpose d' g { \relative c'' { e4( g8 fis) e4( d8 b) } } } { s1 } >> |
  % m. 175: RECAP-S; A7 (transposed)
  \barNumberCheck #175 << { \transpose d' g { \relative c'' { cis4( d8 e) <g, cis e>4( <a cis e>) } } } { s1 } >> |
  % m. 176: RECAP-S; Bm (transposed)
  \barNumberCheck #176 << { \transpose d' g { \relative c'' { <b d fis>2 r4 fis'8( e) } } } { s1\p } >> |
  % m. 177: RECAP-S; Bm (transposed)
  \barNumberCheck #177 << { \transpose d' g { \transpose c c' { \relative c'' { d4( cis8 b) a4( fis8 d) } } } } { s1\mp\< } >> |
  % m. 178: RECAP-S; Em (transposed)
  \barNumberCheck #178 << { \transpose d' g { \relative c'' { e8( fis g a) b4( g8 e) } } } { s1 } >> |
  % m. 179: RECAP-S; D (transposed)
  \barNumberCheck #179 << { \transpose d' g { \relative c'' { fis4( g8 a) d4( cis8 b) } } } { s1 } >> |
  % m. 180: RECAP-S; F#m (transposed)
  \barNumberCheck #180 << { \transpose d' g { \transpose c c' { \relative c'' { a8( g fis e) d4( fis8 a) } } } } { s1 } >> |
  % m. 181: RECAP-S; G (transposed)
  \barNumberCheck #181 << { \transpose d' g { \transpose c c' { \relative c'' { b4( a8 g) fis4( e8 d) } } } } { s1\f\! } >> |
  % m. 182: RECAP-S; Em (transposed)
  \barNumberCheck #182 << { \transpose d' g { \relative c'' { e4( fis8 g) <g b e>2 } } } { s1 } >> |
  % m. 183: RECAP-S; A7 (transposed)
  \barNumberCheck #183 << { \transpose d' g { \relative c'' { <fis a d>2 <e g cis>4( <e g a>) } } } { s1 } >> |
  % m. 184: RECAP-S; D (transposed)
  \barNumberCheck #184 << { \transpose d' g { \relative c'' { <fis a d>1 } } } { s1\f } >> |
  % m. 185: RECAP-C; D (transposed)
  \barNumberCheck #185 << { \transpose d' g { \relative c'' { d8-. fis-. a-. d-. cis( b a g) } } } { s1\f } >> |
  % m. 186: RECAP-C; A7 (transposed)
  \barNumberCheck #186 << { \transpose d' g { \relative c'' { fis8( e fis d) cis4( a) } } } { s1 } >> |
  % m. 187: RECAP-C; G (transposed)
  \barNumberCheck #187 << { \transpose d' g { \relative c'' { b8-. d-. g-. b-. a( g fis e) } } } { s1 } >> |
  % m. 188: RECAP-C; A7 (transposed)
  \barNumberCheck #188 << { \transpose d' g { \relative c'' { <e g a>2 <cis e a>2 } } } { s1 } >> |
  % m. 189: RECAP-C; D (transposed)
  \barNumberCheck #189 << { \transpose d' g { \relative c'' { fis8( e fis d) a4( cis8 e) } } } { s1\mp\> } >> |
  % m. 190: RECAP-C; D/A (transposed)
  \barNumberCheck #190 << { \transpose d' g { \relative c'' { d8( cis d b) a4( fis) } } } { s1 } >> |
  % m. 191: RECAP-C; A7 (transposed)
  \barNumberCheck #191 << { \transpose d' g { \relative c'' { <g a cis>2 <e g a>2 } } } { s1 } >> |
  % m. 192: RECAP-C; D (transposed)
  \barNumberCheck #192 << { \transpose d' g { \transpose c c, { \relative c'' { <fis a d>2 r2 } } } } { s1\p\! } >> |
  % m. 193: CODA; G
  \barNumberCheck #193 << { \relative c'' { e8( d e c) b4( d8 g) } } { s1\p } >> |
  % m. 194: CODA; Cm
  \barNumberCheck #194 << { \relative c'' { ees8( d ees c) bes4( g) } } { s1\pp } >> |
  % m. 195: CODA; G/B
  \barNumberCheck #195 << { \relative c'' { b8( a g b) d4( g8 fis) } } { s1\mp\< } >> |
  % m. 196: CODA; Am/C
  \barNumberCheck #196 << { \relative c'' { e4( d8 c) a2 } } { s1 } >> |
  % m. 197: CODA; C
  \barNumberCheck #197 << { \relative c'' { <b d g>2 <c e g>2 } } { s1\f } >> |
  % m. 198: CODA; D7
  \barNumberCheck #198 << { \relative c'' { <b d g>2 <a c fis>2 } } { s1 } >> |
  % m. 199: CODA; D7
  \barNumberCheck #199 << { \relative c'' { <g b g'>2 <fis a d fis>2 } } { s1\ff\! } >> |
  % m. 200: CODA; G
  \barNumberCheck #200 << { \relative c'' { <g b d g>1 } } { s1\ff } >> |
  \bar "|."
}
lh = {
  % m. 1: P; G
  \barNumberCheck #1 << { \absolute { <g, d>2 <g b>2 } } { s1\pp\< } >> |
  % m. 2: P; D7
  \barNumberCheck #2 << { \absolute { <d a>2 <c' fis'>2 } } { s1 } >> |
  % m. 3: P; G
  \barNumberCheck #3 << { \absolute { <g, d>2 <g b>2 } } { s1\p\! } >> |
  % m. 4: P; D7
  \barNumberCheck #4 << { \absolute { <d a>2 <c' fis'>2 } } { s1 } >> |
  % m. 5: P; Em
  \barNumberCheck #5 << { \absolute { <e b>2 <e' g'>2 } } { s1\p } >> |
  % m. 6: P; C
  \barNumberCheck #6 << { \absolute { <c g>2 <c' e'>2 } } { s1 } >> |
  % m. 7: P; D7
  \barNumberCheck #7 << { \absolute { <d a>2 <c' fis'>2 } } { s1 } >> |
  % m. 8: P; G
  \barNumberCheck #8 << { \absolute { d4 <a c' fis'> g,2 } } { s1 } >> |
  % m. 9: P; G
  \barNumberCheck #9 << { \absolute { g,8( b d b g b d b) } } { s1\mp\< } >> |
  % m. 10: P; D7
  \barNumberCheck #10 << { \absolute { d8( fis' a fis' c' fis' a fis') } } { s1 } >> |
  % m. 11: P; G
  \barNumberCheck #11 << { \absolute { g,8( b d b g b d b) } } { s1 } >> |
  % m. 12: P; D
  \barNumberCheck #12 << { \absolute { d8( fis' a fis' d' fis' a fis') } } { s1 } >> |
  % m. 13: P; C
  \barNumberCheck #13 << { \absolute { c8( e' g e' c' e' g e') } } { s1 } >> |
  % m. 14: P; D/F#
  \barNumberCheck #14 << { \absolute { fis,8( fis a fis d fis a fis) } } { s1 } >> |
  % m. 15: P; A7
  \barNumberCheck #15 << { \absolute { a,8( cis' e cis' g cis' e cis') } } { s1 } >> |
  % m. 16: P; D
  \barNumberCheck #16 << { \absolute { d8( fis' a fis' d' fis' a fis') } } { s1 } >> |
  % m. 17: P; G
  \barNumberCheck #17 << { \absolute { g,8( d g b g d g d) } } { s1\mf\! } >> |
  % m. 18: P; D/F#
  \barNumberCheck #18 << { \absolute { fis,8( a d fis d a d a) } } { s1 } >> |
  % m. 19: P; Em
  \barNumberCheck #19 << { \absolute { e8( b e' g' e' b e' b) } } { s1 } >> |
  % m. 20: P; B7
  \barNumberCheck #20 << { \absolute { b,8( fis a dis' a fis a fis) } } { s1 } >> |
  % m. 21: P; C
  \barNumberCheck #21 << { \absolute { c8( g c' e' c' g c' g) } } { s1\> } >> |
  % m. 22: P; Am/C
  \barNumberCheck #22 << { \absolute { c8( e a c' a e a e) } } { s1 } >> |
  % m. 23: P; D7
  \barNumberCheck #23 << { \absolute { d8( a c' fis' c' a c' a) } } { s1 } >> |
  % m. 24: P; G
  \barNumberCheck #24 << { \absolute { <g, d g>2 r2 } } { s1\pp\! } >> |
  % m. 25: TR; Em
  \barNumberCheck #25 << { \absolute { e4 <b e' g'>8-. <b e' g'>-. e4 <b e' g'>4-. } } { s1\mp\< } >> |
  % m. 26: TR; D/F#
  \barNumberCheck #26 << { \absolute { fis,4 <a d fis>8-. <a d fis>-. fis,4 <a d fis>4-. } } { s1 } >> |
  % m. 27: TR; G
  \barNumberCheck #27 << { \absolute { g,4 <d g b>8-. <d g b>-. g,4 <d g b>4-. } } { s1 } >> |
  % m. 28: TR; F#7
  \barNumberCheck #28 << { \absolute { fis,4 <cis e ais>8-. <cis e ais>-. fis,4 <cis e ais>4-. } } { s1 } >> |
  % m. 29: TR; Bm
  \barNumberCheck #29 << { \absolute { b,4 <fis b d'>8-. <fis b d'>-. b,4 <fis b d'>4-. } } { s1\mf\! } >> |
  % m. 30: TR; E7
  \barNumberCheck #30 << { \absolute { e4 <b d' gis'>8-. <b d' gis'>-. e4 <b d' gis'>4-. } } { s1 } >> |
  % m. 31: TR; A
  \barNumberCheck #31 << { \absolute { a,4 <e a cis'>8-. <e a cis'>-. a,4 <e a cis'>4-. } } { s1 } >> |
  % m. 32: TR; D
  \barNumberCheck #32 << { \absolute { d4 <a d' fis'>8-. <a d' fis'>-. d4 <a d' fis'>4-. } } { s1 } >> |
  % m. 33: TR; A/C#
  \barNumberCheck #33 << { \absolute { cis4 <e a cis'>8-. <e a cis'>-. cis4 <e a cis'>4-. } } { s1\mf\< } >> |
  % m. 34: TR; D
  \barNumberCheck #34 << { \absolute { d4 <a d' fis'>8-. <a d' fis'>-. d4 <a d' fis'>4-. } } { s1 } >> |
  % m. 35: TR; Bm
  \barNumberCheck #35 << { \absolute { b,4 <fis b d'>8-. <fis b d'>-. b,4 <fis b d'>4-. } } { s1 } >> |
  % m. 36: TR; A7
  \barNumberCheck #36 << { \absolute { a,4 <e g cis'>8-. <e g cis'>-. a,4 <e g cis'>4-. } } { s1 } >> |
  % m. 37: TR; A7
  \barNumberCheck #37 << { \absolute { a,4 <e g cis'>8-. <e g cis'>-. a,4 <e g cis'>4-. } } { s1\f\! } >> |
  % m. 38: TR; A7
  \barNumberCheck #38 << { \absolute { a,4 <e g cis'>8-. <e g cis'>-. a,4 <e g cis'>4-. } } { s1 } >> |
  % m. 39: TR; A7
  \barNumberCheck #39 << { \absolute { a,4 <e g cis'>8-. <e g cis'>-. a,4 <e g cis'>4-. } } { s1 } >> |
  % m. 40: TR; A
  \barNumberCheck #40 << { \absolute { <a, e a>2 r2 } } { s1\pp } >> |
  % m. 41: S; D
  \barNumberCheck #41 << { \absolute { d8( a d' fis' d' a d' a) } } { s1\pp\< } >> |
  % m. 42: S; A/C#
  \barNumberCheck #42 << { \absolute { cis8( e a cis' a e a e) } } { s1 } >> |
  % m. 43: S; Bm
  \barNumberCheck #43 << { \absolute { b,8( fis b d' b fis b fis) } } { s1 } >> |
  % m. 44: S; F#m
  \barNumberCheck #44 << { \absolute { fis,8( cis fis a fis cis fis cis) } } { s1 } >> |
  % m. 45: S; G
  \barNumberCheck #45 << { \absolute { g,8( d g b g d g d) } } { s1\> } >> |
  % m. 46: S; Em
  \barNumberCheck #46 << { \absolute { e8( b e' g' e' b e' b) } } { s1 } >> |
  % m. 47: S; A7
  \barNumberCheck #47 << { \absolute { a,8( e g cis' g e g e) } } { s1 } >> |
  % m. 48: S; D
  \barNumberCheck #48 << { \absolute { d8( a d' fis' d' a d' a) } } { s1\! } >> |
  % m. 49: S; D
  \barNumberCheck #49 << { \absolute { d8( a d' fis' d' a d' a) } } { s1\p\< } >> |
  % m. 50: S; A/C#
  \barNumberCheck #50 << { \absolute { cis8( e a cis' a e a e) } } { s1 } >> |
  % m. 51: S; Bm
  \barNumberCheck #51 << { \absolute { b,8( fis b d' b fis b fis) } } { s1 } >> |
  % m. 52: S; D/A
  \barNumberCheck #52 << { \absolute { a,8( d fis a fis d fis d) } } { s1 } >> |
  % m. 53: S; G
  \barNumberCheck #53 << { \absolute { g,8( d g b g d g d) } } { s1\mp\! } >> |
  % m. 54: S; Em
  \barNumberCheck #54 << { \absolute { e8( b e' g' e' b e' b) } } { s1 } >> |
  % m. 55: S; A7
  \barNumberCheck #55 << { \absolute { a,8( e g cis' g e g e) } } { s1 } >> |
  % m. 56: S; Bm
  \barNumberCheck #56 << { \absolute { b,8( fis b d' b fis b fis) } } { s1\pp } >> |
  % m. 57: S; Bm
  \barNumberCheck #57 << { \absolute { b,8( fis b d' b fis b fis) } } { s1\p\< } >> |
  % m. 58: S; Em
  \barNumberCheck #58 << { \absolute { e8( b e' g' e' b e' b) } } { s1 } >> |
  % m. 59: S; D
  \barNumberCheck #59 << { \absolute { d8( a d' fis' d' a d' a) } } { s1 } >> |
  % m. 60: S; F#m
  \barNumberCheck #60 << { \absolute { fis,8( cis fis a fis cis fis cis) } } { s1 } >> |
  % m. 61: S; G
  \barNumberCheck #61 << { \absolute { g,8( d g b g d g d) } } { s1\mf\! } >> |
  % m. 62: S; Em
  \barNumberCheck #62 << { \absolute { e8( b e' g' e' b e' b) } } { s1 } >> |
  % m. 63: S; A7
  \barNumberCheck #63 << { \absolute { a,8( e g cis' g e g e) } } { s1 } >> |
  % m. 64: S; D
  \barNumberCheck #64 << { \absolute { <d a d'>1 } } { s1\mp } >> |
  % m. 65: C; D
  \barNumberCheck #65 << { \absolute { d4 <a d' fis'>8-. <a d' fis'>-. d4 <a d' fis'>4-. } } { s1\mf } >> |
  % m. 66: C; A7
  \barNumberCheck #66 << { \absolute { a,4 <e g cis'>8-. <e g cis'>-. a,4 <e g cis'>4-. } } { s1 } >> |
  % m. 67: C; G
  \barNumberCheck #67 << { \absolute { g,4 <d g b>8-. <d g b>-. g,4 <d g b>4-. } } { s1 } >> |
  % m. 68: C; A7
  \barNumberCheck #68 << { \absolute { a,4 <e g cis'>8-. <e g cis'>-. a,4 <e g cis'>4-. } } { s1 } >> |
  % m. 69: C; D
  \barNumberCheck #69 << { \absolute { d4 <a d' fis'>8-. <a d' fis'>-. d4 <a d' fis'>4-. } } { s1\p\> } >> |
  % m. 70: C; D/A
  \barNumberCheck #70 << { \absolute { a,4 <d fis a>8-. <d fis a>-. a,4 <d fis a>4-. } } { s1 } >> |
  % m. 71: C; A7
  \barNumberCheck #71 << { \absolute { a,4 <e g cis'>8-. <e g cis'>-. a,4 <e g cis'>4-. } } { s1 } >> |
  % m. 72: C; D
  \barNumberCheck #72 << { \absolute { <d a d'>2 r2 } } { s1\pp\! } >> |
  % m. 73: DEV; Bm
  \barNumberCheck #73 << { \absolute { b,8( d' fis d' b d' fis d') } } { s1\pp\< } >> |
  % m. 74: DEV; F#7
  \barNumberCheck #74 << { \absolute { fis,8( ais cis ais e ais cis ais) } } { s1 } >> |
  % m. 75: DEV; Bm
  \barNumberCheck #75 << { \absolute { b,8( d' fis d' b d' fis d') } } { s1 } >> |
  % m. 76: DEV; F#7
  \barNumberCheck #76 << { \absolute { fis,8( ais cis ais e ais cis ais) } } { s1 } >> |
  % m. 77: DEV; Bm
  \barNumberCheck #77 << { \absolute { g8( fis g e) d4( fis8 b) } } { s1\mf\! } >> |
  % m. 78: DEV; B7
  \barNumberCheck #78 << { \absolute { a8( fis a fis) dis4( b,) } } { s1 } >> |
  % m. 79: DEV; Em
  \barNumberCheck #79 << { \absolute { c'8( b c a) g4( b8 e') } } { s1 } >> |
  % m. 80: DEV; B7
  \barNumberCheck #80 << { \absolute { fis8( e dis cis) b2 } } { s1 } >> |
  % m. 81: DEV; Em
  \barNumberCheck #81 << { \absolute { e8( g' b g' e' g' b g') } } { s1\mp\< } >> |
  % m. 82: DEV; B7
  \barNumberCheck #82 << { \absolute { b,8( dis' fis dis' a dis' fis dis') } } { s1 } >> |
  % m. 83: DEV; Em
  \barNumberCheck #83 << { \absolute { e8( g' b g' e' g' b g') } } { s1 } >> |
  % m. 84: DEV; B7
  \barNumberCheck #84 << { \absolute { b,8( dis' fis dis' a dis' fis dis') } } { s1 } >> |
  % m. 85: DEV; Em
  \barNumberCheck #85 << { \absolute { c'8( b c' a) g4( b8 e') } } { s1\f\! } >> |
  % m. 86: DEV; E7
  \barNumberCheck #86 << { \absolute { d'8( b d' b) gis4( e) } } { s1 } >> |
  % m. 87: DEV; Am
  \barNumberCheck #87 << { \absolute { f'8( e' f' d') c'4( e'8 a') } } { s1 } >> |
  % m. 88: DEV; E7
  \barNumberCheck #88 << { \absolute { b8( a gis fis) e2 } } { s1 } >> |
  % m. 89: DEV; Am
  \barNumberCheck #89 << { \absolute { a,8( e a c' a e a e) } } { s1\pp\< } >> |
  % m. 90: DEV; F
  \barNumberCheck #90 << { \absolute { f8( c' f' a' f' c' f' c') } } { s1 } >> |
  % m. 91: DEV; G7
  \barNumberCheck #91 << { \absolute { g,8( d f b f d f d) } } { s1 } >> |
  % m. 92: DEV; C
  \barNumberCheck #92 << { \absolute { c8( g c' e' c' g c' g) } } { s1 } >> |
  % m. 93: DEV; Dm
  \barNumberCheck #93 << { \absolute { d8( a d' f' d' a d' a) } } { s1\mp } >> |
  % m. 94: DEV; Em
  \barNumberCheck #94 << { \absolute { e8( b e' g' e' b e' b) } } { s1 } >> |
  % m. 95: DEV; F
  \barNumberCheck #95 << { \absolute { f8( c' f' a' f' c' f' c') } } { s1 } >> |
  % m. 96: DEV; Cm
  \barNumberCheck #96 << { \absolute { c8( g c' ees' c' g c' g) } } { s1 } >> |
  % m. 97: DEV; Ab
  \barNumberCheck #97 << { \absolute { aes,8( ees aes c' aes ees aes ees) } } { s1\mf\! } >> |
  % m. 98: DEV; Bb
  \barNumberCheck #98 << { \absolute { bes,8( f bes d' bes f bes f) } } { s1 } >> |
  % m. 99: DEV; Cm
  \barNumberCheck #99 << { \absolute { c8( g c' ees' c' g c' g) } } { s1 } >> |
  % m. 100: DEV; Bb
  \barNumberCheck #100 << { \absolute { bes,8( f bes d' bes f bes f) } } { s1 } >> |
  % m. 101: DEV; Eb
  \barNumberCheck #101 << { \absolute { ees8( bes ees' g' ees' bes ees' bes) } } { s1\f\< } >> |
  % m. 102: DEV; D7
  \barNumberCheck #102 << { \absolute { d8( a c' fis' c' a c' a) } } { s1 } >> |
  % m. 103: DEV; Gm
  \barNumberCheck #103 << { \absolute { g,8( d g bes g d g d) } } { s1 } >> |
  % m. 104: DEV; A7b9
  \barNumberCheck #104 << { \absolute { a,8( g bes cis' bes g bes g) } } { s1 } >> |
  % m. 105: RT; A7b9
  \barNumberCheck #105 << { \absolute { a,8 <g bes cis'> a, <g bes cis'> a, <g bes cis'> a, <g bes cis'> } } { s1\f\! } >> |
  % m. 106: RT; Ger6
  \barNumberCheck #106 << { \absolute { ees8 <bes cis' g'> ees <bes cis' g'> ees <bes cis' g'> ees <bes cis' g'> } } { s1 } >> |
  % m. 107: RT; G/D
  \barNumberCheck #107 << { \absolute { d8 <a d' g'> d <a d' g'> d <a d' g'> d <a d' g'> } } { s1 } >> |
  % m. 108: RT; D7
  \barNumberCheck #108 << { \absolute { d8 <a c' fis'> d <a c' fis'> d <a c' fis'> d <a c' fis'> } } { s1 } >> |
  % m. 109: RT; D7
  \barNumberCheck #109 << { \absolute { d8 <a c' fis'> d <a c' fis'> d <a c' fis'> d <a c' fis'> } } { s1\mf\> } >> |
  % m. 110: RT; G/D
  \barNumberCheck #110 << { \absolute { d8 <a d' g'> d <a d' g'> d <a d' g'> d <a d' g'> } } { s1 } >> |
  % m. 111: RT; D7
  \barNumberCheck #111 << { \absolute { d8 <a c' fis'> d <a c' fis'> d <a c' fis'> d <a c' fis'> } } { s1 } >> |
  % m. 112: RT; G/D
  \barNumberCheck #112 << { \absolute { d8 <a d' g'> d <a d' g'> d <a d' g'> d <a d' g'> } } { s1 } >> |
  % m. 113: RT; D7
  \barNumberCheck #113 << { \absolute { d8 <fis a c'> d <fis a c'> d <fis a c'> d <fis a c'> } } { s1\p } >> |
  % m. 114: RT; G/D
  \barNumberCheck #114 << { \absolute { d8 <g b d'> d <g b d'> d <g b d'> d <g b d'> } } { s1 } >> |
  % m. 115: RT; D7
  \barNumberCheck #115 << { \absolute { d8 <fis a c'> d <fis a c'> d <fis a c'> d <fis a c'> } } { s1 } >> |
  % m. 116: RT; D7
  \barNumberCheck #116 << { \absolute { d8 <g b d'> d <g b d'> d <g b d'> d <g b d'> } } { s1 } >> |
  % m. 117: RT; D7
  \barNumberCheck #117 << { \absolute { d8 <fis a c'> d <fis a c'> d <fis a c'> d <fis a c'> } } { s1\pp } >> |
  % m. 118: RT; A7
  \barNumberCheck #118 << { \absolute { d8 <fis a c'> d <fis a c'> d <fis a c'> d <fis a c'> } } { s1 } >> |
  % m. 119: RT; D7
  \barNumberCheck #119 << { \absolute { d8 <fis a c'> d <fis a c'> d <fis a c'> d <fis a c'> } } { s1 } >> |
  % m. 120: RT; D7
  \barNumberCheck #120 << { \absolute { d2 <d fis a c'>2 } } { s1\ppp\! } >> |
  % m. 121: RECAP-P; G
  \barNumberCheck #121 << { \absolute { g,8( d g b g d g d) } } { s1\p\< } >> |
  % m. 122: RECAP-P; D7
  \barNumberCheck #122 << { \absolute { d8( a c' fis' c' a c' a) } } { s1 } >> |
  % m. 123: RECAP-P; G
  \barNumberCheck #123 << { \absolute { g,8( d g b g d g d) } } { s1 } >> |
  % m. 124: RECAP-P; D7
  \barNumberCheck #124 << { \absolute { d8( a c' fis' c' a c' a) } } { s1 } >> |
  % m. 125: RECAP-P; Em
  \barNumberCheck #125 << { \absolute { e8( b e' g' e' b e' b) } } { s1\mp\! } >> |
  % m. 126: RECAP-P; C
  \barNumberCheck #126 << { \absolute { c8( g c' e' c' g c' g) } } { s1 } >> |
  % m. 127: RECAP-P; D7
  \barNumberCheck #127 << { \absolute { d8( a c' fis' c' a c' a) } } { s1 } >> |
  % m. 128: RECAP-P; G
  \barNumberCheck #128 << { \absolute { d4 <a c' fis'> g,2 } } { s1 } >> |
  % m. 129: RECAP-P; G
  \barNumberCheck #129 << { \absolute { g,8( b d b g b d b) } } { s1\mf\< } >> |
  % m. 130: RECAP-P; D7
  \barNumberCheck #130 << { \absolute { d8( fis' a fis' c' fis' a fis') } } { s1 } >> |
  % m. 131: RECAP-P; G
  \barNumberCheck #131 << { \absolute { g,8( b d b g b d b) } } { s1 } >> |
  % m. 132: RECAP-P; D
  \barNumberCheck #132 << { \absolute { d8( fis' a fis' d' fis' a fis') } } { s1 } >> |
  % m. 133: RECAP-P; C
  \barNumberCheck #133 << { \absolute { c8( e' g e' c' e' g e') } } { s1 } >> |
  % m. 134: RECAP-P; D/F#
  \barNumberCheck #134 << { \absolute { fis,8( fis a fis d fis a fis) } } { s1 } >> |
  % m. 135: RECAP-P; A7
  \barNumberCheck #135 << { \absolute { a,8( cis' e cis' g cis' e cis') } } { s1 } >> |
  % m. 136: RECAP-P; D
  \barNumberCheck #136 << { \absolute { d8( fis' a fis' d' fis' a fis') } } { s1 } >> |
  % m. 137: RECAP-P; G
  \barNumberCheck #137 << { \absolute { g,8( d g b g d g d) } } { s1\f\! } >> |
  % m. 138: RECAP-P; D/F#
  \barNumberCheck #138 << { \absolute { fis,8( a d fis d a d a) } } { s1 } >> |
  % m. 139: RECAP-P; Em
  \barNumberCheck #139 << { \absolute { e8( b e' g' e' b e' b) } } { s1 } >> |
  % m. 140: RECAP-P; B7
  \barNumberCheck #140 << { \absolute { b,8( fis a dis' a fis a fis) } } { s1 } >> |
  % m. 141: RECAP-P; C
  \barNumberCheck #141 << { \absolute { c8( g c' e' c' g c' g) } } { s1\> } >> |
  % m. 142: RECAP-P; Am/C
  \barNumberCheck #142 << { \absolute { c8( e a c' a e a e) } } { s1 } >> |
  % m. 143: RECAP-P; D7
  \barNumberCheck #143 << { \absolute { d8( a c' fis' c' a c' a) } } { s1 } >> |
  % m. 144: RECAP-P; G
  \barNumberCheck #144 << { \absolute { <g, d g>2 r2 } } { s1\pp\! } >> |
  % m. 145: RECAP-TR; G
  \barNumberCheck #145 << { \absolute { g,4 <d g b>8-. <d g b>-. g,4 <d g b>4-. } } { s1\mp\< } >> |
  % m. 146: RECAP-TR; D/F#
  \barNumberCheck #146 << { \absolute { fis,4 <a d fis>8-. <a d fis>-. fis,4 <a d fis>4-. } } { s1 } >> |
  % m. 147: RECAP-TR; Am
  \barNumberCheck #147 << { \absolute { a,4 <e a c'>8-. <e a c'>-. a,4 <e a c'>4-. } } { s1 } >> |
  % m. 148: RECAP-TR; B7
  \barNumberCheck #148 << { \absolute { b,4 <fis a dis'>8-. <fis a dis'>-. b,4 <fis a dis'>4-. } } { s1 } >> |
  % m. 149: RECAP-TR; Em
  \barNumberCheck #149 << { \absolute { e4 <b e' g'>8-. <b e' g'>-. e4 <b e' g'>4-. } } { s1\mf\! } >> |
  % m. 150: RECAP-TR; A7
  \barNumberCheck #150 << { \absolute { a,4 <e g cis'>8-. <e g cis'>-. a,4 <e g cis'>4-. } } { s1 } >> |
  % m. 151: RECAP-TR; D
  \barNumberCheck #151 << { \absolute { d4 <a d' fis'>8-. <a d' fis'>-. d4 <a d' fis'>4-. } } { s1 } >> |
  % m. 152: RECAP-TR; G
  \barNumberCheck #152 << { \absolute { g,4 <d g b>8-. <d g b>-. g,4 <d g b>4-. } } { s1 } >> |
  % m. 153: RECAP-TR; D/F#
  \barNumberCheck #153 << { \absolute { fis,4 <a d fis>8-. <a d fis>-. fis,4 <a d fis>4-. } } { s1\mf\< } >> |
  % m. 154: RECAP-TR; G
  \barNumberCheck #154 << { \absolute { g,4 <d g b>8-. <d g b>-. g,4 <d g b>4-. } } { s1 } >> |
  % m. 155: RECAP-TR; Em
  \barNumberCheck #155 << { \absolute { e4 <b e' g'>8-. <b e' g'>-. e4 <b e' g'>4-. } } { s1 } >> |
  % m. 156: RECAP-TR; D7
  \barNumberCheck #156 << { \absolute { d4 <a c' fis'>8-. <a c' fis'>-. d4 <a c' fis'>4-. } } { s1 } >> |
  % m. 157: RECAP-TR; D7
  \barNumberCheck #157 << { \absolute { d4 <a c' fis'>8-. <a c' fis'>-. d4 <a c' fis'>4-. } } { s1\f\! } >> |
  % m. 158: RECAP-TR; D7
  \barNumberCheck #158 << { \absolute { d4 <a c' fis'>8-. <a c' fis'>-. d4 <a c' fis'>4-. } } { s1 } >> |
  % m. 159: RECAP-TR; D7
  \barNumberCheck #159 << { \absolute { d4 <a c' fis'>8-. <a c' fis'>-. d4 <a c' fis'>4-. } } { s1 } >> |
  % m. 160: RECAP-TR; D
  \barNumberCheck #160 << { \absolute { <d a d'>2 r2 } } { s1\pp } >> |
  % m. 161: RECAP-S; D (transposed)
  \barNumberCheck #161 << { \transpose d' g { \absolute { d8( a d' fis' d' a d' a) } } } { s1\pp\< } >> |
  % m. 162: RECAP-S; A/C# (transposed)
  \barNumberCheck #162 << { \transpose d' g { \absolute { cis8( e a cis' a e a e) } } } { s1 } >> |
  % m. 163: RECAP-S; Bm (transposed)
  \barNumberCheck #163 << { \transpose d' g { \absolute { b,8( fis b d' b fis b fis) } } } { s1 } >> |
  % m. 164: RECAP-S; F#m (transposed)
  \barNumberCheck #164 << { \transpose d' g { \absolute { fis,8( cis fis a fis cis fis cis) } } } { s1 } >> |
  % m. 165: RECAP-S; G (transposed)
  \barNumberCheck #165 << { \transpose d' g { \absolute { g,8( d g b g d g d) } } } { s1\> } >> |
  % m. 166: RECAP-S; Em (transposed)
  \barNumberCheck #166 << { \transpose d' g { \absolute { e8( b e' g' e' b e' b) } } } { s1 } >> |
  % m. 167: RECAP-S; A7 (transposed)
  \barNumberCheck #167 << { \transpose d' g { \absolute { a,8( e g cis' g e g e) } } } { s1 } >> |
  % m. 168: RECAP-S; D (transposed)
  \barNumberCheck #168 << { \transpose d' g { \absolute { d8( a d' fis' d' a d' a) } } } { s1\! } >> |
  % m. 169: RECAP-S; D (transposed)
  \barNumberCheck #169 << { \transpose d' g { \absolute { d8( a d' fis' d' a d' a) } } } { s1\p\< } >> |
  % m. 170: RECAP-S; A/C# (transposed)
  \barNumberCheck #170 << { \transpose d' g { \absolute { cis8( e a cis' a e a e) } } } { s1 } >> |
  % m. 171: RECAP-S; Bm (transposed)
  \barNumberCheck #171 << { \transpose d' g { \absolute { b,8( fis b d' b fis b fis) } } } { s1 } >> |
  % m. 172: RECAP-S; D/A (transposed)
  \barNumberCheck #172 << { \transpose d' g { \absolute { a,8( d fis a fis d fis d) } } } { s1 } >> |
  % m. 173: RECAP-S; G (transposed)
  \barNumberCheck #173 << { \transpose d' g { \absolute { g,8( d g b g d g d) } } } { s1\mp\! } >> |
  % m. 174: RECAP-S; Em (transposed)
  \barNumberCheck #174 << { \transpose d' g { \absolute { e8( b e' g' e' b e' b) } } } { s1 } >> |
  % m. 175: RECAP-S; A7 (transposed)
  \barNumberCheck #175 << { \transpose d' g { \absolute { a,8( e g cis' g e g e) } } } { s1 } >> |
  % m. 176: RECAP-S; Bm (transposed)
  \barNumberCheck #176 << { \transpose d' g { \absolute { b,8( fis b d' b fis b fis) } } } { s1\pp } >> |
  % m. 177: RECAP-S; Bm (transposed)
  \barNumberCheck #177 << { \transpose d' g { \absolute { b,8( fis b d' b fis b fis) } } } { s1\p\< } >> |
  % m. 178: RECAP-S; Em (transposed)
  \barNumberCheck #178 << { \transpose d' g { \absolute { e8( b e' g' e' b e' b) } } } { s1 } >> |
  % m. 179: RECAP-S; D (transposed)
  \barNumberCheck #179 << { \transpose d' g { \absolute { d8( a d' fis' d' a d' a) } } } { s1 } >> |
  % m. 180: RECAP-S; F#m (transposed)
  \barNumberCheck #180 << { \transpose d' g { \absolute { fis,8( cis fis a fis cis fis cis) } } } { s1 } >> |
  % m. 181: RECAP-S; G (transposed)
  \barNumberCheck #181 << { \transpose d' g { \absolute { g,8( d g b g d g d) } } } { s1\mf\! } >> |
  % m. 182: RECAP-S; Em (transposed)
  \barNumberCheck #182 << { \transpose d' g { \absolute { e8( b e' g' e' b e' b) } } } { s1 } >> |
  % m. 183: RECAP-S; A7 (transposed)
  \barNumberCheck #183 << { \transpose d' g { \absolute { a,8( e g cis' g e g e) } } } { s1 } >> |
  % m. 184: RECAP-S; D (transposed)
  \barNumberCheck #184 << { \transpose d' g { \absolute { <d a d'>1 } } } { s1\mf } >> |
  % m. 185: RECAP-C; D (transposed)
  \barNumberCheck #185 << { \transpose d' g { \absolute { d4 <a d' fis'>8-. <a d' fis'>-. d4 <a d' fis'>4-. } } } { s1\mf } >> |
  % m. 186: RECAP-C; A7 (transposed)
  \barNumberCheck #186 << { \transpose d' g { \absolute { a,4 <e g cis'>8-. <e g cis'>-. a,4 <e g cis'>4-. } } } { s1 } >> |
  % m. 187: RECAP-C; G (transposed)
  \barNumberCheck #187 << { \transpose d' g { \absolute { g,4 <d g b>8-. <d g b>-. g,4 <d g b>4-. } } } { s1 } >> |
  % m. 188: RECAP-C; A7 (transposed)
  \barNumberCheck #188 << { \transpose d' g { \absolute { a,4 <e g cis'>8-. <e g cis'>-. a,4 <e g cis'>4-. } } } { s1 } >> |
  % m. 189: RECAP-C; D (transposed)
  \barNumberCheck #189 << { \transpose d' g { \absolute { d4 <a d' fis'>8-. <a d' fis'>-. d4 <a d' fis'>4-. } } } { s1\p\> } >> |
  % m. 190: RECAP-C; D/A (transposed)
  \barNumberCheck #190 << { \transpose d' g { \absolute { a,4 <d fis a>8-. <d fis a>-. a,4 <d fis a>4-. } } } { s1 } >> |
  % m. 191: RECAP-C; A7 (transposed)
  \barNumberCheck #191 << { \transpose d' g { \absolute { a,4 <e g cis'>8-. <e g cis'>-. a,4 <e g cis'>4-. } } } { s1 } >> |
  % m. 192: RECAP-C; D (transposed)
  \barNumberCheck #192 << { \transpose d' g { \absolute { <d a d'>2 r2 } } } { s1\pp\! } >> |
  % m. 193: CODA; G
  \barNumberCheck #193 << { \absolute { <g, d>2 <g b>2 } } { s1\pp } >> |
  % m. 194: CODA; Cm
  \barNumberCheck #194 << { \absolute { <c g>2 <c' ees'>2 } } { s1\ppp } >> |
  % m. 195: CODA; G/B
  \barNumberCheck #195 << { \absolute { b,8( d g b d' b g d) } } { s1\p\< } >> |
  % m. 196: CODA; Am/C
  \barNumberCheck #196 << { \absolute { c8( e a c' e' c' a e) } } { s1 } >> |
  % m. 197: CODA; C
  \barNumberCheck #197 << { \absolute { g,2 c2 } } { s1\mf } >> |
  % m. 198: CODA; D7
  \barNumberCheck #198 << { \absolute { d2 d2 } } { s1 } >> |
  % m. 199: CODA; D7
  \barNumberCheck #199 << { \absolute { g,2 d2 } } { s1\f\! } >> |
  % m. 200: CODA; G
  \barNumberCheck #200 << { \absolute { <g, d g>1 } } { s1\f } >> |
  \bar "|."
}
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
