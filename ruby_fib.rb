#!/usr/bin/env ruby

def fib(n)
  if n > 1
    fib(n-1) + fib(n-2)
  else
    n
  end
end

ARGV[0].to_i.times do |i|
  puts fib(i)
end