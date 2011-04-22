fib = (n) ->
  tailfib = (n,a,b) ->
    if n == 0
      a
    else
      tailfib(n-1,b,a+b)
  tailfib(n,0,1)

print fib( process.argv) + "\n"
  