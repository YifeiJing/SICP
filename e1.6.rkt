#lang sicp
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
(define (incretest x y)
  (if (= x y)
          x
          (incretest (+ x 1) y)
          ))
(new-if (= 3 3) 1 0)
(incretest 1 3)