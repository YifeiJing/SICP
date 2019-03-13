#lang sicp
(define (f-iter a b c n)
  (cond ((= n 0) a)
        ((= n 1) b)
        ((= n 2) c)
        (else (f-iter b c (+ (* b 2) c a) (- n 1)))))
(define (f n)
  (f-iter 0 1 2 n))