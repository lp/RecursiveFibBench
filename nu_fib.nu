#!/usr/local/bin/nush

(set argv ((NuApplication sharedApplication) arguments))

(function fib (n)
     (cond
          ((> n 1) (+ (fib (- n 1)) (fib (- n 2))))
          (else (n))))

(((argv 0) integerValue) times: (do (i)
  (puts (fib i))
))
