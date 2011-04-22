#!/usr/local/bin/sbcl --script

(load "sbcl_tailfib_lib.fasl")

(format t "~D~%" (fib (parse-integer (car (cdr *posix-argv*)))))
