#lang sicp
(define (ripple-carry-adder A B S C)
  (define (iter a b s c)
    (cond ((null? (cdr a))
           (let ((cn (make-wire)))
             (set-signal! cn 0)
             (full-adder (car a) (car b) cn (car s) c))
          (else
           (let ((cn (make-wire)))
             (full-adder (car a) (car b) cn (car s) c)
             (iter (cdr a) (cdr b) (cdr s) cn))))))
  (iter A B S C))
