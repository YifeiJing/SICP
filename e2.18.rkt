#lang sicp
(define (reverse list)
  (define (iter l result)
    (if (null? l)
        result
        (iter (cdr l) (cons (car l) result))))
  (iter list nil))
(define ll (list 1 2 3 4))
(define re (reverse ll))
(display re)