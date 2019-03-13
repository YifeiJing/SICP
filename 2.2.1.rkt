#lang sicp
(define (list-ref l n)
  (if (= n 0)
      (car l)
      (list-ref (cdr l) (- n 1))))
(define (length list)
  (if (null? list)
      0
      (+ 1 (length (cdr list)))))
(define ll (list 1 2 3 4))