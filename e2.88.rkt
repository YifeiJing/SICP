#lang sicp
;; Exercise 2.88
;; The crux is to write a generic negation operation
(define (install-negation-package)
  (define (negation-scheme-number x)
    (- x))
  (define (negation-rational x)
    (make-rational (- (numer x)) (denom x)))
  (define (negation-real x)
    (- x))
  (define (negation-complex x)
    (make-complex-from-real-imag (- (real-part x)) (- (imag-part x))))
  (define (negation-polynomial x)
    (if (empty-termlist? x)
        'nil
        (let ((first (first-term x))
              (rest (rest-terms x)))
          (append (make-term (order first) (apply-generic 'negation (coeff first)))
                  (negation-polynomial rest)))))
  ;; installation
  (put 'negation '(scheme-number) negation-scheme-number)
  (put 'negation '(rational) negation-rational)
  (put 'negation '(real) negation-real)
  (put 'negation '(complex) negation-complex)
  (put 'negation '(polynomial) negation-polynomial)
  'done)
(define (sub-terms L1 L2)
  (add-terms L1 (apply-generic 'negation L2)))