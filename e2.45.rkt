#lang sicp
(#%require sicp-pict)
(define (split f g)
  (lambda (painter)
    (f painter (g painter painter))))
(define right-split (split beside below))
(define up-split (split below beside))
(paint (right-split einstein))
