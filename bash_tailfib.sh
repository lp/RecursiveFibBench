#!/bin/bash

function fib() {
  n=$1
  function tailfib() {
    ln=$1
    a=$2
    b=$3
    if test $ln -eq 0
    then echo "$a"
    else echo "`tailfib $(echo $ln-1 | bc) $b $(echo $a+$b | bc)`" | bc
    fi
  }
  echo `tailfib $n 0 1`
}

echo `fib $@`

