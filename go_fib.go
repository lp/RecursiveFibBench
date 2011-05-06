package main

import (
  "fmt"
  "flag"
  "strconv"
  "big"
)

func fib(n *big.Int) *big.Int {
  one := big.NewInt(1)
  two := big.NewInt(2)
  if n.Cmp(one) == 1 {
    n1 := big.NewInt(0)
    n2 := big.NewInt(0)
    nf := big.NewInt(0)
    return nf.Add(fib( n1.Sub(n,one)), fib(n2.Sub(n,two)))
  }
  return n
}

func main() {
  flag.Parse()
  s := flag.Arg(0)
  n, err := strconv.Atoi(s)
  if err != nil {
      fmt.Println(s, err)
      return
  }
  
  for i := 0; i < n; i++ {
    fmt.Printf("%s\n", fib( big.NewInt( int64(i))).String())
  }
}

