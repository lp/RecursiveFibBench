function fib(n) {
  if(n > 1) {
    return fib(n-1) + fib(n-2);
  } else {
    return n;
  }
}

for (var i = 0; i < arguments[0]; i++) {
  print( fib(i));
}
