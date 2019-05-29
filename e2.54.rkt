#lang sicp
(define (equal? list1 list2)
  (cond ((and (null? list1) (null? list2)) true)
        ((or (null? list1) (null? list2)) false)
        ((and (pair? list1) (pair? list2))
         (and (equal? (car list1) (car list2))
              (equal? (cdr list1) (cdr list2))))
        (else (eq? list1 list2))))
(display (equal? '(a list) 1))
