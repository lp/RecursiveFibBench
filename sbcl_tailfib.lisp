#!/usr/local/bin/sbcl --script

(defun fib (n)
  (labels
    ((tailfib (n a b)
      (if (= n 0)
        a
        (tailfib (- n 1) b (+ a b)))))
    (tailfib n 0 1)))

(format t "~D~%" (fib (parse-integer (car (cdr *posix-argv*)))))
