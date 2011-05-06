#!/usr/bin/env io
Range

fib := method( n,
    if(n < 2, return n)
    return fib( n - 2) + fib( n - 1)
)

0 to( System args at(1) asNumber - 1) foreach(i, writeln( fib(i)))
