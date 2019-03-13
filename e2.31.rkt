#lang sicp
(define (tree-map tree f)
  (cond ((null? tree) nil)
        ((pair? tree)
         (cons (tree-map (car tree) f)
               (tree-map (cdr tree) f)))
        (else
         (f tree))))
(define (square-tree tree)
  (tree-map tree (lambda (x) (* x x))))
(display (square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7))))
