#!/usr/bin/env ruby
require 'benchmark'
require 'rubygems'
require 'json'
require 'erb'

$fibs = []
languages = [
  ['bash',                lambda { |n| `./bash_tailfib.sh #{n.to_i}`}],
  ['coffee',              lambda { |n| `coffee coffee_tailfib.coffee #{n.to_i}`}],
  ['D',                   lambda { |n| `./d_tailfib #{n.to_i}`}],
  ['erlang',              lambda { |n| `erl -run erlang_tailfib -- #{n.to_i} -run init stop -noshell`}],
  ['falcon',              lambda { |n| `./falcon_tailfib.fal #{n.to_i}`}],
  ['fscript',             lambda { |n| `./fscript_tailfib.fscript #{n.to_i}`}],
  ['gambit interpreted',  lambda { |n| `./gambit_tailfib.scm #{n.to_i}`}],
  ['gambit compiled',     lambda { |n| `./gambit_tailfib #{n.to_i}`}],
  ['go',                  lambda { |n| `./go_tailfib #{n.to_i}`}],
  ['haskell interpreted', lambda { |n| `runghc haskell_tailfib.hs #{n.to_i}`}],
  ['haskell compiled',    lambda { |n| `./haskell_tailfib #{n.to_i}`}],
  ['io',                  lambda { |n| `./io_tailfib.io #{n.to_i}`}],
  ['js on V8',            lambda { |n| `d8 js_tailfib.js -- #{n.to_i}`}],
  ['js on JavascriptCore',lambda { |n| `/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc js_tailfib.js -- #{n.to_i}`}],
  ['js on Rhino',         lambda { |n| `java org.mozilla.javascript.tools.shell.Main js_tailfib.js #{n.to_i}`}],
  ['js on SpiderMonkey',  lambda { |n| `js js_tailfib.js #{n.to_i}`}],
  ['jruby',               lambda { |n| `jruby ruby_tailfib.rb #{n.to_i}`}],
  ['lua',                 lambda { |n| `./lua_tailfib.lua #{n.to_i}`}],
  ['macruby',             lambda { |n| `./macruby_tailfib.rb #{n.to_i}`}],
  ['macruby aot',         lambda { |n| `./macruby_tailfib #{n.to_i}`}],
  ['C# Mono',             lambda { |n| `mono csharp_tailfib.exe #{n.to_i}`}],
  ['F# Mono',             lambda { |n| `mono fsharp_tailfib.exe #{n.to_i}`}],
  ['neko',                lambda { |n| `neko neko_tailfib.n #{n.to_i}`}],
  ['nu',                  lambda { |n| `./nu_tailfib.nu #{n.to_i}`}],
  ['Objective-C',         lambda { |n| `./objc_tailfib -n #{n.to_i}`}],
  ['parrot',              lambda { |n| `parrot parrot_tailfib.pir #{n.to_i}`}],
  ['perl',                lambda { |n| `./perl_tailfib.pl #{n.to_i}`}],
  ['perl6 rakudo',        lambda { |n| `perl6 perl6_tailfib.pl #{n.to_i}`}],
  ['php',                 lambda { |n| `php -f php_tailfib.php #{n.to_i}`}],
  ['python 2.7',          lambda { |n| `./python_tailfib.py #{n.to_i}`}],
  ['python 3.2',          lambda { |n| `python3 python_tailfib.py #{n.to_i}`}],
  ['racket interpreted',  lambda { |n| `racket racket_tailfib.rkt #{n.to_i}`}],
  ['racket compiled',     lambda { |n| `racket racket_tailfib_rkt.zo #{n.to_i}`}],
  ['rubinius',            lambda { |n| `rbx ruby_tailfib.rb #{n.to_i}`}],
  ['ruby 1.8.7',          lambda { |n| `./ruby_tailfib.rb #{n.to_i}`}],
  ['ruby 1.9.2',          lambda { |n| `/usr/local/Cellar/ruby/1.9.2-p180/bin/ruby ruby_tailfib.rb #{n.to_i}`}],
  ['sbcl interpreted',    lambda { |n| `./sbcl_tailfib.lisp #{n.to_i}`}],
  ['sbcl compiled',       lambda { |n| `./sbcl_tailfib_compiled.lisp #{n.to_i}`}],
  ['scala',               lambda { |n| `scala ScalaTailFib #{n.to_i}`}],
  ['tcl',                 lambda { |n| `./tcl_tailfib.tcl #{n.to_i}`}]
]

def stall(num)
  $stall = {} if $stall.nil?
  $stall[num] = `./objc_tailfib -n #{num.to_i}`.chomp
end

def bench(lang,num)
  out = ""
  rez = Benchmark.realtime { out = lang[1].call(num).chomp }
  [rez,out]
end

def langMax(lang,num,up)
  iter = 0
  fact = 2
  topnum = num
  if lang[2].length > 0
    lownum = lang[2].keys.sort.last
  else
    lownum = 0
  end
  
  maxtail = lambda { |lang,num,up|
    puts "finding #{lang[0]} max: #{num.to_s}"  
    iter += 1
    if iter > 20
      fact += 1
      iter = 0
    end
    
    if up
      num +=  ((topnum-num)/fact).ceil
    else
      num = ((num-lownum)/fact).floor + lownum
    end
    
    rez, out = bench(lang,num)
    if out == stall(num) || out.to_f.to_i.to_s == stall(num)
      lownum = num
      return maxtail.call(lang,num,true)
    else
      hrez, hout = bench(lang,num-1)
      if hout == stall(num-1) || hout.to_f.to_i.to_s == stall(num-1)
        lang[2][num-1] = hrez
        lang[4] = [rez,out]
        return lang
      else
        topnum = num
        return maxtail.call(lang,num,false)
      end
    end
  }
  maxtail.call(lang,num,up)
end

def langFib(lang,num)
  lang[2] = {} unless lang[2]
  unless lang[3]
    rez, out = bench(lang,num)
    if out == stall(num) || out.to_f.to_i.to_s == stall(num)
      lang[2][num] = rez
    else
      lang[3] = true
      lang = langMax(lang,num,false)
    end
  end
  lang
end

def compileCurves(languages)
  averageCurve = languages.inject( Hash.new) do |memo,lang|
    lang[2].each do |num,rez|
      if $fibs.include?(num)
        memo[num] = 0 if memo[num].nil?
        memo[num] += rez
      end
    end
    memo
  end
  
  averageCurve = averageCurve.inject({}) { |memo, (num,rez) |
    memo[num] = rez / languages.reject { |lang| lang[2][num].nil? }.length; memo
  }
  
  languages.map do |lang|
    lang[5] = {} if lang[5].nil?
    lang[2].each do |num,rez|
      lang[5][num] = [rez, averageCurve[num]]
    end
    lang
  end
end

def printResults(languages)
  jsons = {}
  headerScripts = ""
  bodyText = ""
  compileCurves( languages).each do |lang|
    jsonBase = {:cols => [{:id => 'fib', :label => 'fib', :type => 'string'}], :rows => []}
    jsonBase[:cols] << {:id => lang[0], :label => lang[0], :type => 'number'}
    jsonBase[:cols] << {:id => "Average", :label => "Average", :type => 'number'}
    jsonBase[:rows] << {:c => [{:v => '0'}, {:v => 0}, {:v => 0}]}
    lang[5].keys.sort.each do |num|
      row = []
      row << {:v => num.to_s}
      row << {:v => lang[5][num][0]}
      
      if lang[5][num][1].nil?
        findAverage = lambda { |lnum|
          return nil if lnum < 1
          return lang[5][lnum][1] if (not lang[5][lnum].nil?) and (not lang[5][lnum][1].nil?)
          return findAverage.call(lnum-1)
        }
        row << {:v => findAverage.call(num)}
      else
        row << {:v => lang[5][num][1]}
      end
      
      jsonBase[:rows] << {:c => row}
    end
    jsons[lang[0]] = jsonBase
  end
  
  template = ERB.new <<-EOF
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
<script src="https://www.google.com/jsapi" type="text/javascript"></script>
<script>
  google.load('visualization', '1', {packages:['corechart']});
<% jsons.each do |name, data| %>
  google.setOnLoadCallback(drawTable_<%= name.gsub(/\s|\\.|-|\#/, "_") %>);
  function drawTable_<%= name.gsub(/\s|\\.|-|\#/, "_") %>() {
    var json_table = new google.visualization.LineChart(document.getElementById('table_div_json_<%= name.gsub(/\s|\\.|-|\#/, "_") %>'));
    var json_data = new google.visualization.DataTable(<%= JSON.generate(data) %>, 0.6);
    json_table.draw(json_data,
      {width: 1024,
        height: 266,
        title: "<%= name.capitalize %>",
        backgroundColor: {fill: '#dddddd', stroke: '#666666', strokeWidth: 1},
        colors: ['red','#66aacc'],
        lineWidth: 3,
        pointSize: 6,
        interpolateNulls: true,
        hAxis: {title: 'fib(n)', logScale: true},
        vAxis: {title: 'completion time (seconds)',
          maxValue: 1,
          baseline: 0}});
  }
<% end %>
</script>
<body>
<% jsons.keys.sort.each do |name| %>
  <div id="table_div_json_<%= name.gsub(/\s|\\.|-|\#/, "_") %>"></div>
  <br/>
<% end %>
</body>
</html>
EOF
  File.open("tailfib_results.html", "w") do |f|
    f.puts template.result(binding)
  end
end

trap :SIGINT, lambda { printResults(languages); exit }

n = step = ARGV[0].to_i

until languages.select { |lang| not lang[3] }.length < 2
  puts "=============== #{n.to_s} : #{languages.select { |lang| not lang[3] }.map { |lang| lang[0]}.inspect}"
  languages.map! { |lang| langFib(lang,n) }
  $fibs << n
  n += step
  step *= 2
  break if step > 131072
end

printResults(languages)
