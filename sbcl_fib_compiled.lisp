#!/usr/local/bin/sbcl --script

(load "sbcl_fib_lib.fasl")
    
(printfib 0 (- (parse-integer (car (cdr *posix-argv*))) 1))