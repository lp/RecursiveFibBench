// csharp_tailfib.cs
// arguments: A
// compiled with /usr/local/bin/gmcs csharp_fib.cs -r:Mono.Security.dll
using System;
using System.Linq;
using Mono.Math;

public class FibBench
{ 
  static BigInteger Fib (BigInteger n)
  {
    BigInteger one = new BigInteger(1);
    BigInteger two = new BigInteger(2);
    if (n < two)
    {
        return n;
    }
    else
    {
        return Fib(n - one) + Fib(n - two);
    }
  }
  
  public static void Main(string[] args)
  {
    foreach (int i in Enumerable.Range(0, Convert.ToInt32( args[0] )).ToArray())
    {
        Console.WriteLine("{0}", Fib( new BigInteger(i)));
    }
  }
}