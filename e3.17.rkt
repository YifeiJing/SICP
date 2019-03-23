#lang sicp
(define (count-pairs x)
  (define (iscounted? o aux)
    (if (null? aux)
        false
        (if (eq? o (car aux))
            true
            (iscounted? o (cdr aux)))))
  (define (iter x aux)
    (if (not (pair? x))
        0
        (if (iscounted? x aux)
            0
            (let ((new-aux (cons x aux)))
              (+ (iter (car x) new-aux)
                 (iter (cdr x) new-aux)
                 1)))))
  (define cal
    (let ((aux '()))
      (define (inter-iter x)
        (if (not (pair? x))
            0
            (if (iscounted? x aux)
                0
                (begin (set! aux (cons x aux))
                       (+ (inter-iter (car x))
                          (inter-iter (cdr x))
                          1)))))
      inter-iter))
  (cal x))
(define A (cons (cons 1 2) (cons 1 2)))
(define a (cons 1 2))
(define b (cons a a))
(define B (cons b b))
(count-pairs B)