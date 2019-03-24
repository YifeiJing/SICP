#lang sicp
;(define (print-queue queue)
 ; (print "(" (front-queue queue) (rear-queue queue) ")"))
(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (empty-queue?)
      (null? front-ptr))
    (define (front-queue)
      (if (empty-queue?)
          (error "Empty queue")
          (car front-ptr)))
    (define (insert-queue! item)
      (if (empty-queue?)
          (let ((new-pair (cons item '())))
            (set! front-ptr new-pair)
            (set! rear-ptr new-pair))
          (let((new-pair (cons item '()))
               (tmp (cdr rear-ptr)))
            (set! tmp new-pair)
            (set! rear-ptr new-pair))))
    (define (delete-queue!)
      (if (empty-queue?)
          (error "Empty queue")
          (set! front-ptr (cdr front-ptr))))
    (define (dispatch m)
      (cond ((eq? m 'empty-queue?) empty-queue?)
            ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) delete-queue!)
            (else (error "Invalid operation"))))
    dispatch))
(define q (make-queue))
((q 'empty-queue?))
((q 'insert-queue!) 1)
((q 'empty-queue?))