#!/usr/local/bin/dmd -run

import std.stdio;
import std.bigint;

void main(string[] args)
{
    BigInt fib(BigInt n)
    {
        BigInt one = "1";
        BigInt two = "2";
        if (n < two) {
            return n;
        }
        return fib( n - two) + fib( n - one);
    }
    
    BigInt n = args[1];
    for (BigInt i = 0; i < n; i++) {
        writeln( fib( i));
    }
}
