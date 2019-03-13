#lang sicp
(define (repeated f n)
  (define (iter n result)
    (if (= n 0)
        result
        (iter (- n 1) (compose f result))))
  (iter (- n 1) f))
(define (compose f g)
  (lambda (x) (f (g x))))
(define (square i)
  (* i i))
((repeated square 2) 5)

