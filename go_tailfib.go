package main

import (
  "fmt"
  "flag"
  "strconv"
  "big"
)

type funType func(fn funType, ln *big.Int, a *big.Int, b *big.Int) *big.Int

func fib(n int64) *big.Int {
  zero := big.NewInt(0)
  one := big.NewInt(1)
  tailfib := func(fn funType, ln *big.Int, a *big.Int, b *big.Int) *big.Int {
    if ln.Cmp(zero) == 0 {
      return a
    }
    nn := big.NewInt(0)
    ab := big.NewInt(0)
    return fn(fn, nn.Sub(ln,one),b,ab.Add(a,b))
  }
  return tailfib(tailfib,big.NewInt(n),zero,one)
}

func main() {
  flag.Parse()
  s := flag.Arg(0)
  n, err := strconv.Atoi(s)
  if err != nil {
      fmt.Println(s, err)
      return
  }
  fmt.Printf("%s\n", fib( int64(n)).String())
}
