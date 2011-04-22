-module (erlang_tailfib).
-export ([fib/1, tailfib/3, start/0]).

tailfib(N,A,B) ->
  if
    N == 0 ->
      A;
    true ->
      tailfib(N-1,B,A+B)
  end.

fib(N) ->
  tailfib(N,0,1).

start() ->
  io:format("~w~n", [fib( element(1, string:to_integer(lists:nth(1, init:get_plain_arguments()))))]).

