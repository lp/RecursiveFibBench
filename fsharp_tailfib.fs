#light
open System 

let fib (n : bigint) : bigint =
  let rec tailfib (ln : bigint) (a : bigint) (b : bigint) : bigint =
    match ln with
    | _ when ln.IsZero -> a
    | _ -> tailfib (ln - bigint.One) b (a + b)
  tailfib n bigint.Zero bigint.One

let cmdArgs = System.Environment.GetCommandLineArgs()
System.Console.WriteLine( fib (bigint.Parse cmdArgs.[1]))
