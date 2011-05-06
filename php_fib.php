<?php
    function fib ($n){
        if ($n < 2) return $n;
        return fib($n-2)+fib($n-1);
    }
   
   $fib = 'fib';
   for ($i = 0; $i < $argv[1]; $i++){
        print "{$fib( $i)}\n";
   }
?>
