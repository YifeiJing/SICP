#lang sicp
;; Exercise 2.89
;; For dense polynomials
(define (adjoin-term term term-list)
  (define (construct-new-term-list coeff n)
    (if (= n 1)
        (append coeff term-list)
        (construct-new-term-list (append coeff 0) (- n 1))))
  (if (=zero? (coeff term))
      term-list
      (let ((t1 (first-term term-list)))
        (let ((n (- (order term) (order t1))))
          (construct-new-term-list (list (coeff term)) term-list)))))
(define (first-term term-list)
  (make-term (- (length term-list) 1) (car term-list)))
(define (rest-terms term-list)
  (define (iter t)
    (if (eq? t '())
      '()
      (if (= (car t) 0)
          (iter (cdr t))
          t)))
  (iter (cdr term-list)))
