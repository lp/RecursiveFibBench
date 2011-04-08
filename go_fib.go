package main

import (
  "fmt"
  "flag"
  "strconv"
)

func fib(n int) int {
  if n > 1 {
    return fib(n - 1) + fib(n - 2)
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
    fmt.Printf("%d\n", fib(i))
  }
}
