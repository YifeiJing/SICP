#lang sicp
(define (get-record employee personnel-file)
  ((get employee (division employee))
   personnel-file))
; An individual division's file should be taged with its division name, which specifies the data structure being used
(define (get-salary record)
  (look-up 'salary record))
(define (find-employee-record employee divisions)
  (map (lambda (personnel-file) (get-record employee personnel-file)) divisions))

