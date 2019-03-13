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
  (if (f (car seq))
      (cons (car seq)
            (filter f (cdr seq)))
      (filter f (cdr seq))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
(define (prime? n)
  (define (iter i)
    (if (> (* i i) n)
        true
        (if (= (remainder n i) 0)
            false
            (iter (+ i 1)))))
  (iter 2))
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))
