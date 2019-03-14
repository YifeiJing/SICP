#lang sicp
(define (unique-pairs n)
  (accumulate append nil
              (map (lambda (x)
                     (map (lambda (y) (list x y))
                          (enumerate-interval 1 (- x 1))))
                   (enumerate-interval 1 n))))
(define (accumulate f base-value seq)
  (if (null? seq)
      base-value
      (f (car seq)
         (accumulate f base-value (cdr seq)))))
(define (enumerate f start end)
  (if (> start end)
      nil
      (append (list start)
              (enumerate f (f start) end))))
(define (enumerate-interval start end)
  (enumerate (lambda (x) (+ x 1))
             start
             end))
(define (filter f seq)
  (cond ((null? seq) nil)
    ((f (car seq))
         (cons (car seq)
            (filter f (cdr seq))))
    (else (filter f (cdr seq)))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (ordered-triples n s)
  (define (equal-to-s? pair)
    (= s (+ (car pair) (cadr pair) (cadr (cdr pair)))))
  (define (unique-triple-pairs bound)
    (accumulate append nil
                (map (lambda (x)
                       (map (lambda (y) (append (list x) y))
                            (unique-pairs (- x 1))))
                     (enumerate-interval 3 bound))))
  (filter equal-to-s?
          (unique-triple-pairs n)))