#!/usr/local/bin/nush

(set argv ((NuApplication sharedApplication) arguments))

(function fib (n)
    (function tailfib (n a b)
      (cond
        ((eq n 0) (a))
        (else (tailfib (- n 1) b (+ a b)))))
    (tailfib n 0 1))

(puts (fib ((argv 0) integerValue)))
