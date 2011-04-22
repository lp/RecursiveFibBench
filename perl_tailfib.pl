#!/usr/bin/perl -w
use strict;

sub fib {
   my($n) = @_;
   my $tailfib;
   $tailfib = sub {
     my $ln = shift; my $a = shift; my $b = shift;
     if ($ln == 0) {
       return $a;
     } else {
       return $tailfib->(($ln-1),$b,($a+$b));
     }
   };
   return $tailfib->($n,0,1);
}

print fib($ARGV[0]) . "\n";
