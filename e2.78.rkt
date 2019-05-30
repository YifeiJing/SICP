#lang sicp
;; make our system work with ordinary numbers when represents Scheme numbers
(define (type-tag x)
  (if (number? x)
      'scheme-number
      (car x)))
(define (contents x)
  (if (number? x)
      x
      (car x)))
(define (attach-tag type x)
  (if (eq? type 'scheme-number)
      x
      (cons type x)))
