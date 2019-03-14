#lang sicp
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                  (accumulate combiner null-value term
                              (next a) next b))))
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))
(define (sum a b)
  (define (inc i)
    (+ i 1))
  (accumulate + 0 identity a inc b))
(define (product a b)
  (define (inc i)
    (+ i 1))
  (accumulate * 1 identity a inc b))