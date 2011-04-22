// csharp_tailfib.cs
// arguments: A
using System;

public class FibBench
{ 
  delegate decimal TailFib(decimal ln, decimal a, decimal b);
  static decimal Fib (decimal n)
  {
    TailFib tailfib = (ln, a, b) => {
      if (ln == 0)
      {
        return a;
      }
      else
      {
        return tailfib(ln-1,b,a+b);
      }
    };
    return tailfib((decimal)n,0,1);
  }
  
  public static void Main(string[] args)
  {
    Console.WriteLine("{0}", Fib( Convert.ToDecimal(args[0])));
  }
}