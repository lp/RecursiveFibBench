#!/usr/bin/env lua

function fib (n)
  if n > 1 then
    return fib(n-1) + fib(n-2)
  else
    return n
  end
end

for num = 0, arg[1]-1 do
  print ( fib(num))
end