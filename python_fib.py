#!/usr/bin/env python

import sys

def fib(n):
  if (n > 1):
    return fib(n-1) + fib(n-2)
  else:
    return n
    

for i in range( int( sys.argv[1])):
  print fib(i)
