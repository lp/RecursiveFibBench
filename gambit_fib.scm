#!/usr/bin/gsi-script -:d0
   
(define (fib n)
  (if (< n 2)
    n
    (+ (fib (- n 1)) (fib (- n 2)))))
    
(define (printfib bottom top)
  (display (fib bottom))
  (newline)
  (cond [(< bottom top) (printfib (+ bottom 1) top)]))

(define (main arg)
  (printfib 0 (- (string->number arg) 1)))

