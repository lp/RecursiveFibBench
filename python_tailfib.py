#!/usr/bin/env python

import sys
    
def fib(n):
  def tailfib(n,a,b):
    if n == 0:
      return a
    else:
      return tailfib(n-1, b, a+b)
  return tailfib(n, 0, 1)

print( fib( int( sys.argv[1])))
