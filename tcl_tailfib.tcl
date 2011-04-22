#!/usr/bin/tclsh

proc fib {n} {
  proc tailfib {n a b} {
    switch $n {
      0 { return $a }
      default {
        return [tailfib [expr {$n - 1}] $b [expr {$a + $b}]]
      }}}
  return [tailfib $n 0 1]
}

puts [fib [lindex $argv 0]]
