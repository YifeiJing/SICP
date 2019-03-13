#lang sicp
(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))
(display (memq 'apple '(pear banana prune)))
(display (memq 'apple '(x (apple sauce) y apple pear)))