#lang sicp
(define (even? a)
  (= (remainder a 2) 0))
(define (double a)
  (+ a a))
(define (halve a)
  (if (even? a) (/ a 2) -1))
(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))))