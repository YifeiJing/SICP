#lang sicp
(define (make-monitored f)
  (let ((counter 0))
    (lambda (arg)
      (cond ((eq? arg 'how-many-calls?) counter)
            ((eq? arg 'reset-count) (set! counter 0))
            (else
             (set! counter (+ 1 counter))
             (f arg))))))
