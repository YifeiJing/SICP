#lang racket
(define f
  (let ((mem -1))
    (lambda (x)
      (cond ((and (= mem 1) (= x 0)) 1)
            (else
             (set! mem x) 0)))))

(+ (f 0) (f 1))
;therefore + is evaluated from left to right
