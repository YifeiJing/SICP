#lang sicp
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))
(define (choose-branch bit branch)
  (cond ((= bit 1) (right-branch branch))
        ((= bit 0) (left-branch branch))
        (else (error "bad bit: CHOOSE-BRANCH" bit))))
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))
(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree
                    (make-leaf 'D 1)
                    (make-leaf 'C 1)))))
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
(display (decode sample-message sample-tree))
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))
(define (encode-symbol symbol tree)
  (define (contain-symbol? list)
    (if (null? list) false
        (if (eq? (car list) symbol) true
            (contain-symbol? (cdr list)))))
  (define (iter node)
    (cond ((leaf? node) '())
          ((contain-symbol? (symbols (left-branch node)))
           (cons 0 (iter (left-branch node))))
          (else (cons 1 (iter (right-branch node))))))
  (if (contain-symbol? (symbols tree))
      (iter tree)
      (error "The symbol is not in the tree: " symbol)))
(display (encode (decode sample-message sample-tree) sample-tree))
(newline)
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
(define (successive-merge pairs)
  (if (null? (cdr pairs))
      (car pairs)
      (successive-merge (adjoin-set
                         (make-code-tree
                          (car pairs)
                          (cadr pairs))
                         (cdr (cdr pairs))))))
(define original-pairs (list
                        (list 'A 2)
                        (list 'GET 2)
                        (list 'SHA 3)
                        (list 'WAH 1)
                        (list 'BOOM 1)
                        (list 'JOB 2)
                        (list 'NA 16)
                        (list 'YIP 9)))
(define lyrics (list 'GET 'A 'JOB 'SHA 'NA 'NA 'NA 'NA 'NA 'NA 'NA
                     'NA 'GET 'A 'JOB 'SHA 'NA 'NA 'NA 'NA 'NA 'NA 'NA
                     'NA 'WAH 'YIP 'YIP 'YIP 'YIP 'YIP 'YIP 'YIP 'YIP
                     'YIP 'SHA 'BOOM))
(define code-tree (generate-huffman-tree original-pairs))
(display (encode lyrics code-tree))
(define (count-bits code)
  (if (null? code)
      0
      (+ 1 (count-bits (cdr code)))))
(display (count-bits (encode lyrics code-tree)))
(newline)
(display code-tree)