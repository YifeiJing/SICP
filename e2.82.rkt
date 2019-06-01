#lang sicp
;; exercise 2.82
;; define a new method which turn all arguments to the same type
(define (unify-args args n)
  (define (iter i new-args)
    (if (eq? i nil)
        new-args
        (let ((t2 (caar i))
              (t1 (car (find-member args n))))
          (if (eq? t1 t2)
              (iter (cdr i) (append new-args (car i)))
              (let ((t2->t1 (get-coercion t2 t1)))
                (if t2->t1
                    (iter (cdr i) (append new-args (t2->t1 (car i))))
                    (unify-args args (+ n 1))))))))
  (define (find-member list m)
    (define (iter n current-position)
      (if (= n 0)
          (car current-position)
          (iter (- n 1) (cdr current-position))))
    (iter (- m 1) list))
  (if (> n (length args))
      (error "Can not unify all the args to one type")
      (cdr (iter args '(dummy)))))
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (let ((new-args (unify-args args 1)))
            (let ((new-type-tags (map type-tag new-args)))
              (let ((new-proc (get op type-tags)))
                (if new-proc
                    (apply new-proc (map contents new-args))
                    (error "No methods to for these types"
                           (list op new-type-tags))))))))))