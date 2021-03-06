\version "2.16.0"
\pointAndClickOff

\header {
  title = "Doce"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://hinarioespirita.com.br"
    \line { "hinarioespirita.com.br" }
  }
  copyright = \markup {
    \with-url #"https://creativecommons.org/licenses/by-sa/4.0/"
    \line { "Creative Commons Attribution ShareAlike" }
  }
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 72
  \clef treble
}

introToSegno = \relative c' {
  c2 e4 f | g1 | a4 g f a | g2( e)|
  c'2 b4 a | g2 e | f4 f e d | c1 |
  
  c2 e4 f | g1 | a4 g f a | g2 g|
  c2 b4 a | g2 e | f4 f e d | c2 c 
}

segnoToCoda = \relative c' {
  r4 e4 f g | e2 e4. e8 | d4 c d4. f8 | e1 |
  r4 e4 f g | e2.. e8 | d4 c d4. c8 | c1 
}

codaToEnd = \relative c' {
  c2 e4 f | g2 g | a4 g f a | g2 g|
  c2 b4 a | g2 e | f4 f e d | c2 c |
  
  c2 e4 f | g2 g4. g8 | a4 g f a | g2 g|
  c2 b4 a | g2 e4. e8 | f4 f e d | c2 c |
  c'2 b4 a | g2 e4. e8 | f4 f e d | c2 c
}

letra = \lyricmode {
  Do -- ce_é sen -- tir que_em meu co -- ra -- ção,
  Hu -- mil -- de -- men -- te, vai nas -- cen -- do_a -- mor.
  Do -- ce_é sa -- ber: não es -- tou so -- zi -- nho;
  Sou u -- ma par -- te de_u -- ma_i -- men -- sa vi -- da

  Que, ge -- ne -- ro -- sa, re -- luz de_en -- con -- tro_a mim.
  I -- men -- so dom do Seu a -- mor sem fim.

  O céu nos des -- tes, as es -- tre -- las cla -- ras,
  Nos -- so ir -- mão Sol, nos -- sa_ir -- mã a Lu -- a;
  Nos -- sa mãe Ter -- ra, com fru -- tos cam -- pos, flo -- res;
  O fo -- go_e_o ven -- to, o ar e_a á -- gua pu -- ra:
  Fon -- te de vi -- da de Su -- a cri -- a -- tu -- ra.
}

introToSegnoChords = \chordmode {
  c1 | e:m | f2 g:7 | c1 | 
  a1:m | e:m | f2 g:7 | \repeat percent 2 {c1} |

  e:m | f2 g:7 | c1 | 
  a:m | e:m | f2 g:7 | c1 
}

segnoToCodaChords = \chordmode {
  a:m | e:m | f2 g:7 | c1 |
  a:m | e:m | f2 g:7 | c1
}

codaToEndChords = \chordmode {
  c | e:m | f2 g:7 | c1 | 
  a:m | e:m | f2 g:7 | \repeat percent 2 {c1} |
  
  e:m | f2 g:7 | c1 | 
  a:m | e:m | f2 g:7 | c1 |
  a:m | e:m | f2 g:7 | c1 |
}

\score {
  <<
    \new ChordNames { 
      \set majorSevenSymbol = \markup { 7M }
      \introToSegnoChords
      \segnoToCodaChords
      \codaToEndChords
    }
    \new Staff <<
      \new Voice = "melodia" { 
        \global
        
        \introToSegno
        
        \mark \markup { \musicglyph #"scripts.segno" }
        \bar "."
        \segnoToCoda
        \bar "."
        \mark \markup { \musicglyph #"scripts.coda" }
        
        \codaToEnd
        \mark \markup { \center-align { \musicglyph #"scripts.segno" "al" \musicglyph #"scripts.coda" }}
        \bar "|."
      }
      \lyricsto "melodia" \new Lyrics \letra
      \set Staff.midiInstrument = #"acoustic grand"
    >>
  >>
  \layout {}
}

\score {
  <<
    \new ChordNames { 
      \introToSegnoChords
      \segnoToCodaChords
      \codaToEndChords
      \segnoToCodaChords
    }
    \new Staff <<
      \new Voice = "melodia" { 
        \global
        \introToSegno
        \segnoToCoda
        \codaToEnd
        \segnoToCoda
      }
      \lyricsto "melodia" \new Lyrics \letra
      \set Staff.midiInstrument = #"acoustic grand"
    >>
  >>
  \midi {}
}
