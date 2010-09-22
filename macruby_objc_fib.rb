#!/usr/local/bin/macruby

framework 'FibRunner.framework'

ARGV[0].to_i.times do |i|
  puts FibRunner.fib(i)
end