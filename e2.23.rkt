#lang sicp
(define (for-each f list)
  (cond ((null? list) true)
        (else (f (car list))
              (for-each f (cdr list)))))
(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))
