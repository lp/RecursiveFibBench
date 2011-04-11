#!/bin/bash

function fib() {
  n=$1
  if test $n -lt 2
  then echo "$n"
  else echo "`fib $(echo $n-1 | bc)`+`fib $(echo $n-2 | bc)`" | bc
  fi
}

for ((n=0;n<$@;n++)) do
  echo `fib $n`
done
