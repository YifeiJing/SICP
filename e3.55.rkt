#lang sicp
(define (partial-sums s)
  (define (iter a b)
    (cons-stream (+ a (stream-car b)) (iter (stream-car b) (stream-cdr b))))
  (iter 0 s))
