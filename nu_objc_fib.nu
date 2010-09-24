#!/usr/local/bin/nush

(load "FibRunner")

(set argv ((NuApplication sharedApplication) arguments))

(((argv 0) integerValue) times: (do (i)
  (puts (FibRunner fib:i))
))
