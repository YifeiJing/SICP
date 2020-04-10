#lang sicp
;; simple variable length argument
(define (foo . a)
  (define (iter l res)
    (if (null? l)
        res
        (iter (cdr l) (+ res (car l)))))
  (display a)
  (iter a 0))
(foo 1 2 3 4 5 6)
;; e3.50
(define (stream-map proc . argstreams)
  (if (null? (car-stream argstreams))
      empty-stream
      (cons-stream
       (apply proc (map car-stream argstreams))
       (apply stream-map
              (cons proc (map cdr-stream argstreams))))))
