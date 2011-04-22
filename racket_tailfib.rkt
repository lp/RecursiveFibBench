#lang racket

(define (fib n)
  (letrec ((tailfib (lambda (n a b)
    (if (= n 0)
        a
        (tailfib (- n 1) b (+ a b))))))
  (tailfib n 0 1)))

(displayln (fib (string->number (first (vector->list (current-command-line-arguments))))))
