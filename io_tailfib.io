#!/usr/bin/env io

fib := method( n,
    tailfib := method(n,a,b,
        if(n == 0, return a)
        return tailfib(n - 1, b, a + b)
    )
    tailfib( n, 0, 1)
)

writeln( fib( System args at(1) asNumber))
