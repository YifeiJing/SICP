#lang sicp
(define (install-raise-package)
  (define (raise-int x)
    ;; int -> rational
    (make-rat x 1))
  (define (raise-rat x)
    ;; rat -> real
    (/ (numer x) (/ (denom x) 1.0)))
  (define (raise-real x)
    (make-complex-from-real-imag x 0))
  ;; install
  (put 'raise 'scheme-number
       (lambda (x)
         (tag 'rational (raise-int x))))
  (put 'raise 'rational
       (lambda (x)
         (tag 'real (raise-rat x))))
  (put 'raise 'real
       (lambda (x)
         (tag 'complex (raise-real x))))
  'done)
