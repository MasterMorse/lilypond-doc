% Test file to develop the interface to \annotate
% See https://github.com/openlilylib/lilypond-doc/wiki/Documenting-musical-content for discussion

\version "2.17.18"

% Plain signature of the function draft
annotate = 
#(define-music-function (parser location type properties annotation item)
   (string? ly:context-mod? string? symbol-list-or-music?)
     (define props (ly:get-context-mods properties))
     ;(ly:input-warning location voice)
     #{
        \once \override $item #'color = #red
     #}
   )

\relative g' {
  \annotate "critremark" 
      \with {
         voice = "vc1"
         source = "Ms. 2"
         author = "Urs Liska"
         date = "2013-06-06"
       }
    "Tenuto added as in Vc. 2"
    Script
  g1-- 
}
