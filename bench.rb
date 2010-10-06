#!/usr/bin/env ruby

# require 'benchmark'
# 
# n = 10
# Benchmark.bm do |x|
#   x.report("ruby %d" % n) { system("./ruby_fib.rb %d" % n) }
#   x.report("macruby %d" % n) { system("./macruby_fib.rb %d" % n)}
#   x.report("macruby w/objc %d" % n) { system("./macruby_objc_fib.rb %d" % n) }
#   x.report("nu %d" % n) { system("./nu_fib.nu %d" % n) }
#   x.report("nu w/objc %d" % n) { system("./nu_objc_fib.nu %d" % n)}
#   x.report("python %d" % n) { system("./python_fib.py %d" % n) }
#   x.report("sbcl %d" % n) { system("./sbcl_fib.lisp %d" % n)}
#   x.report("objc %d" % n) { system("./objc_fib -n %d" % n) }
# end

require 'bencher'

bench = Bencher.new ARGV do
  [["ruby", lambda { |v,r| system("./ruby_fib.rb %d" % v) } ],
    ["macruby", lambda { |v,r| system("./macruby_fib.rb %d" % v) }],
    ["macruby w/objc", lambda { |v,r| system("./macruby_objc_fib.rb %d" % v) }],
    ["macruby w/aot", lambda { |v,r| system("./macruby_fib_aot %d" % v) }],
    ["jruby", lambda { |v,r| system("jruby ruby_fib.rb %d" % v) }],
    ["nu", lambda { |v,r|  system("./nu_fib.nu %d" % v) } ],
    ["nu w/objc", lambda { |v,r| system("./nu_objc_fib.nu %d" % v) } ],
    ["python", lambda { |v,r| system("./python_fib.py %d" % v) } ],
    ["sbcl", lambda { |v,r| system("./sbcl_fib.lisp %d" % v) } ],
    ["sbcl compiled", lambda { |v,r| system("./sbcl_fib_compiled.lisp %d" % v) } ],
    ["objc", lambda { |v,r| system("./objc_fib -n %d" % v) }],
    ["coffee", lambda { |v,r| system("coffee coffee_fib.coffee %d" % v) }],
    ["js on v8", lambda { |v,r| system("d8 js_v8_fib.js -- %d" % v) }],
    ["perl", lambda { |v,r| system("./perl_fib.pl %d" % v) }],
    ["lua", lambda { |v,r| system("./lua_fib.lua %d" % v) }],
    ["falcon", lambda { |v,r| system("./falcon_fib.fal %d" % v) }]
    ]
end

bench.run
