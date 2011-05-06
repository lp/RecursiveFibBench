#light
open System 

let rec fib (n : bigint) : bigint =
    match n with
    | _ when n.IsZero -> (bigint 0)
    | _ when n.IsOne -> (bigint 1)
    | _ -> ((fib (n - bigint.One)) + (fib (n - (bigint 2))))

let cmdArgs = System.Environment.GetCommandLineArgs()
for i in 0 .. (Convert.ToInt32( cmdArgs.[1]) - 1) do
    System.Console.WriteLine( fib ( bigint i))