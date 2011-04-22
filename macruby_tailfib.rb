#! /usr/local/bin/macruby

def fib(n)
  tailfib = lambda do |n, a, b|
    return a if n == 0
    tailfib.call( n-1, b, a+b)
  end
  tailfib.call(n, 0, 1)
end

puts fib( ARGV[0].to_i)
