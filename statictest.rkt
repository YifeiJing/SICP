#lang sicp
(define (P m) (begin (display m) (display "from static")))
(define (Q x) (P x))
(let ((P (lambda (x) (begin (display x) (display "from dynamic")))))
  (Q 'Hello))
  