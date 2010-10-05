fib = (n) ->
  if n > 1
    fib(n-1) + fib(n-2)
  else
    n
    
for num in [0...process.argv]
  print fib(num) + "\n"