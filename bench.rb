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
    ["nu", lambda { |v,r|  system("./nu_fib.nu %d" % v) } ],
    ["nu w/objc", lambda { |v,r| system("./nu_objc_fib.nu %d" % v) } ],
    ["python", lambda { |v,r| system("./python_fib.py %d" % v) } ],
    ["sbcl", lambda { |v,r| system("./sbcl_fib.lisp %d" % v) } ],
    ["sbcl compiled", lambda { |v,r| system("./sbcl_fib_compiled.lisp %d" % v) } ],
    ["objc", lambda { |v,r| system("./objc_fib -n %d" % v) }]
    ]
end

bench.run
