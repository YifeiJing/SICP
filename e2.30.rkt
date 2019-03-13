#lang sicp
(define (square-tree tree)
  (cond ((null? tree) nil)
        ((pair? tree)
         (cons (square-tree (car tree))
               (square-tree (cdr tree))))
        (else (* tree tree))))
(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-map sub-tree)
             (* sub-tree sub-tree)))
       tree))
(display (square-tree-map
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7))))