fib = (n) ->
  if n > 1
    fib(n-1) + fib(n-2)
  else
    n

for num in [0...process.argv[2]]
  console.log fib(num)

