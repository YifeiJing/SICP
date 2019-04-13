#lang sicp
(define (make-table same-key?)
  (define local-table (list '*table*))
  (define (assoc key subtable)
    (if (null? subtable)
        false
        (let ((item (car subtable)))
          (if (same-key? key (car item))
              item
              (assoc key (cdr subtable))))))
  (define (look-up key)
    (let ((record (assoc key (cdr local-table))))
      (if record
          (cdr record)
          false)))
  (define (insert! key value)
    (let ((record (assoc key (cdr local-table))))
      (if record
          (set-car! record value)
          (let ((new-item (cons key value)))
            (let ((new-index (cons new-item (cdr local-table))))
              (set-cdr! local-table new-index))))))
  (define (dispatch m)
    (cond ((eq? m 'lookup) look-up)
          ((eq? m 'insert!) insert!)
          (else (error "Invalid command"))))
  dispatch)
              
; tests
(define kasumi (make-table eq?))
((kasumi 'insert!) 'Kasumi 'host)
((kasumi 'insert!) 'Altoria 'guest)