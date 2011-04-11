#!/usr/bin/env ruby

require 'bencher'

bench = Bencher.new ARGV[0].to_i, ARGV[1].to_i do
  [["ruby", lambda { |v,r| system("./ruby_fib.rb %d" % v) } ],
    ["macruby", lambda { |v,r| system("./macruby_fib.rb %d" % v) }],
    ["macruby w/objc", lambda { |v,r| system("./macruby_objc_fib.rb %d" % v) }],
    ["macruby w/aot", lambda { |v,r| system("./macruby_fib_aot %d" % v) }],
    ["jruby", lambda { |v,r| system("jruby ruby_fib.rb %d" % v) }],
    ["nu", lambda { |v,r|  system("./nu_fib.nu %d" % v) } ],
    ["nu w/objc", lambda { |v,r| system("./nu_objc_fib.nu %d" % v) } ],
    ["python", lambda { |v,r| system("./python_fib.py %d" % v) } ],
    ["python3", lambda { |v,r| system("python3 python_fib.py %d" % v) } ],
    ["sbcl", lambda { |v,r| system("./sbcl_fib.lisp %d" % v) } ],
    ["sbcl compiled", lambda { |v,r| system("./sbcl_fib_compiled.lisp %d" % v) } ],
    ["objc", lambda { |v,r| system("./objc_fib -n %d" % v) }],
    ["coffee", lambda { |v,r| system("coffee coffee_fib.coffee %d" % v) }],
    ["js on v8", lambda { |v,r| system("d8 js_v8_fib.js -- %d" % v) }],
    ["perl", lambda { |v,r| system("./perl_fib.pl %d" % v) }],
    ["perl6 rakudo", lambda { |v,r| system("perl6 perl6_fib.pl %d" % v) }],
    ["lua", lambda { |v,r| system("./lua_fib.lua %d" % v) }],
    ["falcon", lambda { |v,r| system("./falcon_fib.fal %d" % v) }],
    ["f-script", lambda { |v,r| system("./fscript_fib.fscript %d" % v) }],
    ["f-script w/objc", lambda { |v,r| system("./fscript_fib_objc.fscript %d" % v) }],
    ["haskell interpreted", lambda { |v,r| system("runghc haskell_fib.hs %d" % v) }],
    ["haskell compiled", lambda { |v,r| system("./haskell_fib %d" % v)}],
    ["racket interpreted", lambda { |v,r| system("racket racket_fib.rkt %d" % v) }],
    ["racket compiled", lambda { |v,r| system("racket racket_fib_compiled_rkt.zo %d" % v) }],
    ["rubinius", lambda { |v,r| system("rbx ./ruby_fib.rb %d" % v) } ],
    ["go", lambda { |v,r| system("./go_fib %d" % v) }],
    ["erlang", lambda { |v,r| system("erl -run erlang_fib -- %d -run init stop -noshell" % v) }],
    ["scala", lambda { |v,r| system("scala ScalaFib %d" % v) }],
    ["tcl", lambda { |v,r| system("./tcl_fib.tcl %d" % v) }]
    ]
end

bench.run
