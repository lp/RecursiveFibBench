(defun fib (n)
  (labels
    ((tailfib (n a b)
      (if (= n 0)
        a
        (tailfib (- n 1) b (+ a b)))))
    (tailfib n 0 1)))
