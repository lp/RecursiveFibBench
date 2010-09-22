#!/usr/local/bin/nush

(load "FibRunner")

(set argv ((NuApplication sharedApplication) arguments))

(for ((set i 0) (< i ((argv objectAtIndex:0) integerValue)) (set i (+ i 1)))
     (puts (FibRunner fib:i)))

