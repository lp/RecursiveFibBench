(defun fib (n)
  (if (< n 2)
    n
    (+ (fib (- n 1)) (fib (- n 2)))))

(defun printfib (start end)
  (format t "~D~%" (fib start))
  (if (< start end)
    (printfib (+ start 1) end)))
