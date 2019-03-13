#lang sicp
(define (square x) (* x x))
(define (abs x)
  (cond ((< x 0) (- x))
        ((= x 0) x)
        ((> x 0) x)))
(define (squareOfLarge2 a b c)
  (cond ((and (< a b) (< a c)) (+ (square c) (square b)))
        ((and (< b a) (> b c)) (+ (square c) (square a)))
        ((and (< c a) (> c b)) (+ (square b) (square a)))))

(define (a-plus-abs-b a b)
  ((if (< b 0) - +) a b))

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))
(define (>= x y)
  (or (> x y) (= x y)))