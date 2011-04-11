#!/usr/bin/tclsh

proc fib {n} {
  switch $n {
    0 { return $n }
    1 { return $n } 
    default {
      return [expr [fib [expr {$n - 1}]] + [fib [expr {$n - 2}]]]
    }
  }
}

for {set i 0} {$i < [lindex $argv 0]} {incr i} {
  puts [fib $i]
}
