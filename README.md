# lilypond-bow-positions

You can use the file [bow-positions.ily](bow-positions.ily) in this repository to add bow positions in LilyPond v2.24.0 or later.
These are modified [`Dynamics` contexts](https://lilypond.org/doc/Documentation/internals/dynamics) that you can align above a staff.
For example, running:

```sh
lilypond --output=bow-positions --svg - <<EOS
\version "2.24.0"
\include "bow-positions.ily"
\paper {
  page-breaking = #ly:one-line-auto-height-breaking
  top-margin = 0
  left-margin = 0
  right-margin = 0
  oddFooterMarkup = ##f
}
\pointAndClickOff
\new Staff="violin" <<
  \new Bowing \with {
    alignAboveContext = "violin"
  } {
    s1 \sulPont \tweak minimum-length #12 \> |
    s2. \sulTasto \tweak minimum-length #12 \> s4 \ordinario |
  }
  {
    g'1~ |
    1 |
  }
>>
EOS
```

will output:

<img src="bow-positions.svg">
