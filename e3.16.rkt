#lang racket
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))
(define A (cons (cons 1 2) (cons 2 3)))
(count-pairs A)
(define a (cons 1 2))
(define b (cons a a))
(define c (cons b b))
(count-pairs c)