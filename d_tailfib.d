#!/usr/local/bin/dmd -run

import std.stdio;
import std.bigint;

void main(string[] args)
{
    BigInt fib(BigInt n)
    {
        BigInt zero = "0";
        BigInt one = "1";
        BigInt tailfib(BigInt n, BigInt a, BigInt b) {
            if (n == zero) {
                return a;
            }
            return tailfib(n - one, b, a + b);
        }
        return tailfib( n, zero, one);
    }
    
    BigInt n = args[1];
    writeln( fib( n));
}
