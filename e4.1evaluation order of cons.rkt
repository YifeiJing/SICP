#lang sicp
(cons (begin (display "left") 'l)
      (begin (display "right") 'r))
(let ((right (begin (display "right") 'r)))
  (cons (begin (display "left") 'l)
        right))