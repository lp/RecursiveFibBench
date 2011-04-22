import System( getArgs )

fib :: Integer -> Integer
fib n = tailfib([n,0,1])
  where
    tailfib [n,a,b]
      | n == 0 = a
      | True = tailfib([n-1,b,a+b])

main = do
  args <- getArgs
  case args of
    [numFib] -> print (fib (read numFib::Integer))
    _ -> print "need a number of fib on input"
