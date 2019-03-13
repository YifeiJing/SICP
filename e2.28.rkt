#lang sicp
(define (fringe list)
  (cond ((null? list) nil)
        ((pair? (car list))
         (append (fringe (car list)) (fringe (cdr list))))
        (else (cons (car list) (fringe (cdr list))))))
(define (append x y)
  (if (null? x)
      y
      (cons (car x) (append (cdr x) y))))
(define x (list (list 1 2) (list 3 4)))
(fringe x)
