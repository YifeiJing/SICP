#lang sicp
(define (last-pair list)
  (if (null? (cdr list))
      (car list)
      (last-pair (cdr list))))
(define ll (list 1 2 3 4))
(last-pair ll)
