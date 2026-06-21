\version "2.24.0"

\layout {
  \context {
    \Dynamics
    \name Bowing
    \alias Dynamics
    crescendoSpanner = #'text
    decrescendoText = \markup { }
    decrescendoSpanner = #'text
    \override DynamicTextSpanner.bound-details.right.arrow = ##t
    \override DynamicTextSpanner.style = #'line
    \override DynamicTextSpanner.whiteout = ##t
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.basic-distance = #0
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.minimum-distance = #0
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #0
    \override VerticalAxisGroup.staff-affinity = #DOWN
  }
  \inherit-acceptability Bowing Dynamics
}

\midi {
  \context {
    \Dynamics
    \name Bowing
    \alias Dynamics
  }
  \inherit-acceptability Bowing Dynamics
}

ordinario = #(make-dynamic-script (markup #:normal-text #:whiteout "ord."))

sulPont = #(make-dynamic-script (markup #:normal-text #:whiteout "s.p."))
pocoSulPont = #(make-dynamic-script (markup #:normal-text #:whiteout "p.s.p."))
moltoSulPont = #(make-dynamic-script (markup #:normal-text #:whiteout "m.s.p."))

sulTasto = #(make-dynamic-script (markup #:normal-text #:whiteout "s.t."))
pocoSulTasto = #(make-dynamic-script (markup #:normal-text #:whiteout "p.s.t."))
moltoSulTasto = #(make-dynamic-script (markup #:normal-text #:whiteout "m.s.t."))

% This ensures that custom Bowing contexts passed to \addQuote can be created.
% Without this, numerous “cannot create context” warnings are thrown from
% \addQuote. This was shared by David Kastrup on the bug-lilypond list:
%   https://lists.gnu.org/archive/html/bug-lilypond/2025-09/msg00003.html
% The default partCombineListener is defined in ly/declarations-init.ly:
%   https://github.com/lilypond/lilypond/blob/master/ly/declarations-init.ly
partCombineListener = \layout {
  \partCombineListener
  \context {
    \Dynamics
    \name Bowing
    \alias Dynamics
  }
  \inherit-acceptability Bowing Dynamics
}
