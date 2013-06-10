% Develop the interface to \annotate
% See https://github.com/openlilylib/lilypond-doc/wiki/Documenting-musical-content for discussion

\version "2.17.18"

annotate = 
#(define-music-function (parser location properties item)
   (ly:context-mod? symbol-list-or-music?)
   ;; annotates a musical object for use with lilypond-doc
   
   ; Dummy coloring
     #{ 
       \tweak color #magenta #item
     #}
   )

% Usage examples

\relative g' {
  % default call with specified grob
  \annotate \with {
    type = "critical remark"
    context = "vc1"
    author = "Urs Liska"
    date = "2013-06-06"
    message = "Tenuto added as in Vc. 2"
  }
  Script
  g1-- |
  
  % default call without specified grob (defaults to NoteHead (?))
  \annotate \with {
    type = "question"
    source = "MS2"
    message = "Ms. 2: b flat"
  }
  a4 b 
  
     % postfix call
     c-\annotate \with {
      type = "todo"
      message = "Improve tie engraving"
    }
    ~ 
    c 
}
