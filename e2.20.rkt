#lang sicp
(define (same-parity x . l)
  (define parity (remainder x 2))
  (define (iter ll)
    (if (null? ll)
        nil
        (let ((num (car ll)))
          (if (= parity (remainder num 2))
              (cons num (iter (cdr ll)))
              (iter (cdr ll))))))
  (cons x (iter l)))
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
