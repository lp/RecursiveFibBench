object ScalaFib {
  def main(args: Array[String]) {
    for (i <- 0 to args.head.toInt-1)
      println(fib(i))
  }
  
  def fib(n: Int): Int = {
    if (n < 2)
      n;
    else
      fib(n -1) + fib(n - 2);
  }
}
