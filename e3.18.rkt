#lang sicp
(define (contain-cycle? stru)
  (define p1 stru)
  (define p2 (cdr stru))
  (define (iter)
    (if (or (null? p1) (null? p2))
        false
        (if (eq? p1 p2)
            true
            (if (null? (cddr p2))
                false
                (begin (set! p1 (cdr p1))
                       (set! p2 (cddr p2))
                       (iter))))))
  (iter))
(define A '(1 2 3))
(contain-cycle? A)

    
