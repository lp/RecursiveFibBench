use v6;

sub fib($n) {
   if ($n > 1) {
     return fib($n-1) + fib($n-2);
   } else {
     return $n;
   }
}

loop (my $i = 0; $i < @*ARGS[0]; $i++) {
  say fib($i);
}