#lang sicp
(define (double f)
  (lambda (x) (f (f x))))
(define (inc i)
  (+ i 1))
(((double (double double)) inc) 5)
