#lang sicp
(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))
(define integers (integers-starting-from 1))
(define (divisible? x y) (= (remainder x y) 0))
(define no-sevens
  (stream-filter (lambda (x) (not (divisible? x 7)))
                 integers))
(define (sieve s)
  (cons-stream
   (stream-car s)
   (sieve (stream-filter (lambda (x) (not (divisible? x (stream-car s))))
                         (stream-cdr s)))))
(define primes (sieve (integers-starting-from 2)))
;; implicitly define a infinite stream
(define ones (cons-stream 1 ones))
;; more interesting manipulations
(define (add-streams a b) (stream-map + a b))
;; another define of integers
(define integers
  (cons-stream 1 (stream-map + ones integers)))
