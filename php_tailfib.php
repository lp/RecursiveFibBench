<?php
    $fib = function($n){
        function tailfib ($n, $a, $b){
            if ($n == 0) return $a;
            return tailfib( $n-1, $b, $a+$b);
        }
        return tailfib($n,0,1);
    };
   
    print "{$fib( $argv[1])}\n";
?>
