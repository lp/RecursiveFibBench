use v6;

sub fib($n) {
  my $tailfib;
  $tailfib = -> $ln,$a,$b {
    if ($ln == 0) {
      return $a;
    } else {
      return $tailfib(($ln-1),$b,($a+$b));
    }
  };
  return $tailfib($n,0,1);
}

say fib( @*ARGS[0]);

