#lang racket

(define (fib n)
  (cond [(< n 2) n] [else (+ (fib (- n 1)) (fib (- n 2)))]))

(define (printfib bottom top)
  (displayln (fib bottom))
  (cond [(< bottom top) (printfib (+ bottom 1) top)]))

(printfib 0 (- (string->number (first (vector->list (current-command-line-arguments)))) 1))
