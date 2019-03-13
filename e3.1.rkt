#lang sicp
(define (make-accumulator initial)
  (lambda (arg)
    (begin (set! initial (+ initial arg))
           initial)))
