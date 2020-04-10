#lang sicp
(define factorials
  (cons-stream 1 (mul-streams factorials integers)))
