#lang sicp
(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))
(define (cube-sum a b)
  (if (> a b)
      0
      (+ (cube a)
         (cube-sum (+ a 1) b))))
(define (cube a)
  (* a a a))
(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2)))
         (pi-sum (+ a 4) b))))
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (sum-int a b)
  (sum identity a inc b))
(define (inc i)
  (+ i 1))
(define (sum-cube a b)
  (sum cube a inc b))
(define (sum-pi a b)
  (define (pi-term a)
    (/ 1.0 (* a (+ a 2))))
  (define (pi-next a)
    (+ a 4))
  (sum pi-term a pi-next b))
(define (integral f a b dx)
  (define (integral-next x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) integral-next b) dx))
(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (simpson-next x)
    (+ x (* 2 h)))
  (* (/ h 3) (+ (f a) (f (+ a (* n h))) (* 4 (sum f (+ a h) simpson-next
                                                  (+ a (* (- n 1) h))))
                (* 2 (sum f (+ a (* 2 h)) simpson-next (+ a (* (- n 2) h)))))))
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))
(define si sum-iter)