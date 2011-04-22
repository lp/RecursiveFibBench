import scala.math.BigInt

object ScalaTailFib {
  def main(args: Array[String]) {
    println( fib( args.head.toLong))
  }
  
  def fib(n: Long): String = {
    val zero = BigInt(0)
    val one = BigInt(1)
    def tailfib(n: BigInt, a: BigInt, b: BigInt): BigInt = {
        if (n == zero) a else tailfib( n - one, b, a + b)
    }
    val num = BigInt(n)
    tailfib(num,zero,one).toString()
  }
  
}
