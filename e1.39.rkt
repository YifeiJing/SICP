#lang sicp
(define (tan-cf x k)
  (define (iter i result)
    (cond ((= i 0) result)
          ((= i 1) (/ x (- 1 result)))
          (else (iter (- i 1) (/ (square x) (- (- (* 2 i) 1) result))))))
  (define (square i ) (* i i))
  (iter (- k 1) (/ (square x) (- (* 2 k) 1))))
