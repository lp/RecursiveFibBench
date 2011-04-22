#!/usr/bin/env lua

function fib (n)
  tailfib = function(n,a,b)
    if n == 0 then
      return a
    else
      return tailfib(n-1,b,a+b)
    end
  end
  return tailfib(n,0,1)
end

print ( fib( tonumber(arg[1])))
