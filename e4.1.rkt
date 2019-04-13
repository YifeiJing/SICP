#lang sicp
(define (list-of-values-l2r exp env)
  (if (last-exp? exp)
      '()
      (let ((first-value (eval (first-exp exp) env)))
        (cons first-value
              (list-of-values-l2r (rest-exps exp) env)))))
(define (list-of-values-r2l exp env)
  (if (last-exp? exp)
      '()
      (let ((rest-values (list-of-values-r2l (rest-exps exp) env)))
        (cons (eval (first-exp exp) env)
              (rest-values)))))

