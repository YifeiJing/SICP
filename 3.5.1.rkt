#lang sicp
;; lazy eval based stream implementation
;;(define (delay e)
  ;;(lambda () e))
(define (force delayed-object)
  (delayed-object))
;;(define (cons-stream a b)
  ;;(cons a (delay b)))
(define (car-stream stream)
  (car stream))
(define (cdr-stream stream)
  (force (cdr stream)))
(define empty-stream nil)
(define (stream-enumerate-interval low high)
  (if (> low high)
      empty-stream
      (begin (counter low)
             (cons
              low
              ;;(delay (stream-enumerate-interval (+ low 1) high))))))
              ;;(lambda () (stream-enumerate-interval (+ low 1) high))))))
              (memo-proc (lambda () (stream-enumerate-interval (+ low 1) high)))))))
(define (stream-null? stream)
  (null? stream))
(define (stream-filter pred seq-stream)
  (cond ((stream-null? seq-stream) empty-stream)
        ((pred (car-stream seq-stream)) (cons (car-stream seq-stream)
                                              ;;(delay (stream-filter pred (cdr-stream seq-stream)))))
                                              ;;(lambda () (stream-filter pred (cdr-stream seq-stream)))))
                                              (memo-proc (lambda () (stream-filter pred (cdr-stream seq-stream))))))
        (else (stream-filter pred (cdr-stream seq-stream)))))
(define (stream-ref stream n)
  (if (= n 0)
      (car-stream stream)
      (stream-ref (cdr-stream stream) (- n 1))))
(define (stream-map proc stream)
  (if (stream-null? stream)
      empty-stream
      (cons
       (proc (car-stream stream))
       (lambda () (stream-map proc (cdr-stream stream))))))
(define (stream-for-each proc stream)
  (if (stream-null? stream)
      'done
      (begin (proc (car-stream))
             (stream-for-each proc (cdr-stream stream)))))
;; an optimazition
(define (memo-proc proc)
  (let ((already-run? false) (result false))
    (lambda ()
      (if (not already-run?)
          (begin (set! result (proc))
                 (set! already-run? true)
                 result)
          result))))
;; counter helper function
(define (counter n)
  (display "counting ") (display n) (newline))
;; traditional sequence operation
(define (filter predicate seq)
  (if (null? seq)
      nil
      (let ((a (car seq)))
        (if (predicate a)
            (cons a (filter predicate (cdr seq)))
            (filter predicate (cdr seq))))))
(define (prime? n)
  (define (iter x)
    (if (> (* x x) n)
        true
        (if (= (remainder n x) 0)
            false
            (iter (+ x 1)))))
  (iter 2))
(define (interval low high)
  (define (iter n res)
    (if (> n high)
        res
        (iter (+ n 1) (append res (list n)))))
  (cdr (iter low (list 1))))
(define (find-prime-number n)
  (car (cdr (filter prime? (interval 1 100000000)))))
;; for test util
;;(find-prime-number 1)

;; test for stream-filter
;;(car-stream (cdr-stream (cdr-stream (stream-filter prime? (stream-enumerate-interval 10000 100000000)))))

;; Test for prime
;;(display (prime? 2))

;; test for stream-enumerate-interval
;;(car-stream (cdr-stream (stream-enumerate-interval 1 3)))

;; display first 10 prime number from 10000
(define (first-ten-prime-number seq)
  (define (iter n stream)
    (if (= n 0)
        (begin (display (- 10 n)) (display ": ") (display (car-stream stream)) (newline))
        (begin (display (- 10 n)) (display ": ") (display (car-stream stream)) (newline)
               (iter (- n 1) (cdr-stream stream)))))
  (iter 9 seq))
;;(first-ten-prime-number (stream-filter prime? (stream-enumerate-interval 10000 100000)))

;; display the 10th prime number from 10000
;;(stream-ref (stream-filter prime? (stream-enumerate-interval 10000 100000)) 9)
;; exer 3.51
(define (show x)
  (display x) (newline) x)
(define x
  (stream-map show
              (stream-enumerate-interval 0 10)))
(stream-ref x 5)
(stream-ref x 7)