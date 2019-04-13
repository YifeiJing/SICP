#lang sicp
(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
           (logical-or (get-signal a1) (get-signal a2))))
      (after-delay
       or-gate-delay
       (lambda () (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)
(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal inout))))
      (after-delay inverter-delay
                   (lambda () (set-signal! output new-value)))))
  (add-action! input invert-input) 'ok)
(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
           (logical-and (get-signal a1) (get-signal a2))))
      (after-delay
       and-gate-delay
       (lambda () (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure))
(define (logical-or a1 a2)
  (or a1 a2))
(define (logical-not a)
  (cond ((= a 0) 1)
        ((= a 1) 0)
        (else (error "Invalid value" a))))

(define (or-gate-another a1 a2 output)
  (let ((s1 (make-wire))
        (s2 (make-wire)))
    (and-gate s1 s2 output)
     'ok))
