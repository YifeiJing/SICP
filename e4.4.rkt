#lang sicp
(define (and? exp)
  (eq? (car exp) 'and))
(define (or? exp)
  (eq? (car exp) 'or))
(define (eval-and exp env)
  ;; (apply and (list-of-values exp env)))  this is wrong
  ;; because special form and will stop evaluation when it
  ;; reaches a false value
  (define (looper exps)
    (if (eq? exps '())
        't
        (if (eval (car exps) env)
            (looper (cdr exps))
            'f)))
  (looper (cdr exp)))
(define (eval-or exp env)
  (define (looper exps)
    (if (eq? exps '())
        'f
        (if (eval (car exps) env)
            't
            (looper (cdr exps)))))
  (looper (cdr exp)))
;; by derived expressions
(define (eval-and-deri exp env)
  (define (expand-clause exp)
    (if (null? exp)
        'false
        (let ((first (car exp))
              (rest (cdr exp)))
          (if (null? rest)
              first
              (make-if first
                       (expand-clause rest)
                       'false)))))
  (expand-clause (cdr exp)))
(define (eval-or-deri exp env)
  (define (expand-clause exp)
    (if (null? exp)
        'fasle
        (let ((first (car exp))
              (rest (cdr exp)))
          (if (null? rest)
              first
              (make-if first
                       'true
                       (expand-clause rest))))))
  (expand-clause (cdr exp)))