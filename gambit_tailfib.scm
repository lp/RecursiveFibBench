#!/usr/bin/gsi-script -:d0

(define (fib n)
  (letrec ((tailfib (lambda (n a b)
    (if (= n 0)
        a
        (tailfib (- n 1) b (+ a b))))))
  (tailfib n 0 1)))

(define (main arg)
  (display (fib (string->number arg))) (newline))

