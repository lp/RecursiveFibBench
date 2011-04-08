-module (erlang_fib).
-export ([fib/1, printfib/2, start/0]).
fib(0) ->
  0;
fib(1) ->
  1;
fib(N) ->
  fib(N - 1) + fib(N - 2).
  
printfib(S,N) ->
  io:format("~w~n", [fib(S)]),
  if
    S < N ->
      printfib(S+1,N);
    true -> ok
  end.

start() ->
  printfib(0, element(1, string:to_integer(lists:nth(1, init:get_plain_arguments()))) - 1).

