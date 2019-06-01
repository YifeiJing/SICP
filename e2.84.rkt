#lang sicp
;; Exercise 2.84
;; First we need to devise a way to test which of the two types is higher in the tower
(define (which-is-higher? type1 type2 tower)
  (define (find-object ob l n)
    (if (eq? l nil)
        0
        (if (eq? ob (car l))
            n
            (find-object ob (cdr l) (+ n 1)))))
  (if (> (find-object type1 tower) (find-object type2 tower))
      1
      2))
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((supertype (which-is-higher? (car type-tags) (cdar type-tags))))
                (if (= supertype 1)
                    (apply (get op (list (car type-tags) (car type-tags))) (list (contents (car args)) (raise (contents (cdar args)) (car type-tags))))
                    (apply (get op (list (cdar type-tags) (cdar type-tags))) (list (raise (contents (car args)) (cdar type-tags)) (contents (cdar args))))))
              (error "multiple args raising not implemented"))))))
(define (raise arg type)
  ;; raise arg to type
  (if (eq? (type-tag arg) type)
      (contents arg)
      (raise ((get 'raise (type-tag arg)) (contents arg)) type)))
