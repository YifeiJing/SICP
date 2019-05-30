#lang sicp
(define (install-=zero?-package)
  (define (rat-zero? x)
    (= (numer x) 0))
  (define (complex-zero? z)
    (= (magnitude z) 0))
  ;; installation
  (put '=zero? 'scheme-number
       (lambda (x) (= x 0)))
  (put '=zero? 'rational
       (lambda (x) (rat-zero? x)))
  (put '=zero? 'complex
       (lambda (z) (complex-zero? z)))
  'done)
(define (=zero? x)
  (apply-generic '=zero? x))
