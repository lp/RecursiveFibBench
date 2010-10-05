#!/usr/bin/perl -w

use strict;
sub fib {
   my($n) = @_;
   if ($n > 1) {
     return fib($n-1) + fib($n-2);
   } else {
     return $n
   }
   
}

for (my $i = 0; $i < $ARGV[0]; $i++) {
  print fib($i) . "\n";
}