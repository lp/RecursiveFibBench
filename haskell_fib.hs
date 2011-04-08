import System( getArgs )

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = (fib (n - 1)) + (fib (n - 2))

printfib :: Int -> IO ()
printfib n = print (fib n)

main = do
  args <- getArgs
  case args of
    [numFib] -> mapM_ printfib [0..((read numFib::Int) - 1)]
    _ -> print "need a number of fib on input"
