.sub main
    .param pmc args
    .local int o
    .local int n
    o = args[1]
    n = o - 1
    'printfib'(0,n)
.end

.sub 'printfib'
    .param int bottom
    .param int top
    .local int rez
    rez = 'fib'( bottom)
    say rez
    if bottom < top goto PRINTNEXT
    goto FINISH
    PRINTNEXT:
        .local int nbottom
        nbottom = bottom + 1
        'printfib'(nbottom, top)
    FINISH:
        .return (0)
.end

.sub 'fib'
    .param int n
    if n < 2 goto LOW
    goto HIGH
    LOW:
        .return (n)
    HIGH:
        .local int x
        .local int y
        x = n - 2
        y = n - 1
        .local int a
        .local int b
        a = 'fib'( x)
        b = 'fib'( y)
        .local int rez
        rez = a + b
        .return ( rez)
.end

