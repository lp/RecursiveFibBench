.sub main
    .param pmc args
    .local int n
    .local int rez
    n = args[1]
    rez = 'fib'(n)
    say rez
.end

.sub 'tailfib'
    .param int n
    .param int a
    .param int b
    if n == 0 goto RETA
    goto RECUR
    RETA:
        .return (a)
    RECUR:
        .local int nn
        .local int ab
        .local int rez
        nn = n - 1
        ab = a + b
        rez = 'tailfib'(nn,b,ab)
        .return (rez)
.end

.sub 'fib'
    .param int n
    .local int rez
    rez = 'tailfib'(n,0,1)
    .return (rez)
.end

