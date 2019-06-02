#lang sicp
;; Exercise 2.87
;; Install =zero? generic arithmetic package
(define (install-=zero?-package)
  (define (=zero?-scheme-number x)
    (= x 0))
  (define (=zero?-rational-number x)
    (= (numer x) x))
  (define (=zeros?-real-number r)
    (= r 0))
  (define (=zero?-complex z)
    (= (real-part z) 0))
  (define (=zero?-term t)
    (apply-generic '=zero? (coeff t)))
  (define (=zero?-polynomial p)
    (if (empty-termlist? p)
        true
        (if (apply-generic '=zero? (first-term p))
            (=zero?-polynomial (rest-terms p))
            false)))
  ;; installation
  (put '=zero? '(scheme-number) =zero?-scheme-number)
  (put '=zero? '(rational) =zero?-rational-number)
  (put '=zero? '(real) =zero?-real-number)
  (put '=zero? '(complex) =zero?-complex)
  (put '=zero? '(term) =zero?-term)
  (put '=zero? '(polynomial) =zero?-polynomial)
  'done)