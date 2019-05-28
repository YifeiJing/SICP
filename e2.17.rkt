#lang sicp
; Return the list that contains only the last element
(define (last-pair list)
  (if (null? (cdr list))
      list
      (last-pair (cdr list))))
(define ll (list 1 2 3 4))
(display (last-pair ll))
