#!/usr/local/bin/nush

(set argv ((NuApplication sharedApplication) arguments))

(function fib (n)
     (cond
          ((> n 1) (+ (fib (- n 1)) (fib (- n 2))))
          (else (n))))

(for ((set i 0) (< i ((argv objectAtIndex:0) integerValue)) (set i (+ i 1)))
     (puts (fib i)))
