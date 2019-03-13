#lang sicp
(define (pascal-triangle row col)
  (cond ((= col 1) 1)
        ((= row col) 1)
        (else (+ (pascal-triangle (- row 1) (- col 1)) (pascal-triangle (- row 1) col)))))