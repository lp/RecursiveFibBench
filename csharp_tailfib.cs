// csharp_tailfib.cs
// arguments: A
// compile with /usr/local/bin/gmcs csharp_tailfib.cs -r:Mono.Security.dll
using System;
using Mono.Math;

public class FibBench
{ 
  delegate BigInteger TailFib(BigInteger ln, BigInteger a, BigInteger b);
  static BigInteger Fib (BigInteger n)
  {
    BigInteger zero = new BigInteger(0);
    BigInteger one = new BigInteger(1);
    TailFib tailfib = (ln, a, b) => {
      if (ln == zero)
      {
        return a;
      }
      else
      {
        return tailfib(ln - one ,b,a+b);
      }
    };
    return tailfib(n, zero, one);
  }
  
  public static void Main(string[] args)
  {
    Console.WriteLine("{0}", Fib( BigInteger.Parse(args[0])));
  }
}