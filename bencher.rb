class Bencher
  require 'benchmark'
  require 'rubygems'
  require 'json'
  
  def initialize(incr,treshold,&block)
    @jsonBase = {:cols => [{:id => 'fib', :label => 'fib', :type => 'string'}], :rows => []}
    @tempOut = {}
    @maxValues = {}
    @results = ""
    @treshold = treshold
    @incr = incr
    @actual = 0
    @cases = Array.new
    @fails = Array.new
    
    block.call.each do |c|
      bCase = BenchCase.new(c[0],c[1])
      @cases << bCase
      @jsonBase[:cols] << {:id => c[0], :label => c[0], :type => 'number'}
    end
    @yard = @cases.length
  end
  
  def run(*rang)
    rang = [1] if rang == []
    
    while (@cases.length > 0) do
      @actual += @incr
      @tempOut[@actual] = {}
      rang.each do |r|
        @cases.each do |c|
          puts "\n#{c.name}:"
          success = nil
          rez = Benchmark.realtime { success = c.proc.call(@actual,r) }
          if success
            c.addTime rez
            c.success!
          else
            c.failed!
          end
          puts "-> %9.3fs" % rez
          @tempOut[@actual][c.name] = rez
          if rez >= @treshold
            @maxValues[c.name] = rez
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| GAME OVER %s! |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" % c.name.upcase
          end
        end
        best = 1

        @results << sprintf("\nCase value: " + @actual.to_s + "\n")
        @cases.sort_by { |c| c.average }.each_with_index do |c,i|
          rank = 0
          if i == 0
            rank = 1
            best = c.average
          else
            rank = c.average / best
          end
          c.addTotal rank
          c.addExectime c.time
          c.addPoints(@yard - i)
          @results << sprintf("%25s: | %d failed | %9.3fs overall | score: %9.3f |\n", c.name, c.failed, c.time, rank)
        end
        
        @fails += @cases.select { |c| c.time >= @treshold}
        @cases.reject! { |c| c.time >= @treshold}
        
      end
      init_run_params
    end
    
    @results << "\nTotals:\n"
    (@cases+@fails).sort_by { |c| c.points }.reverse.each do |c|
      @results << sprintf("%25s: %3d | time: %9.3f score: %9.3f |\n",c.name,c.points,c.exectime,c.total)
    end
    print @results
    
    @jsonOut = @jsonBase
    @tempOut.each_pair do |k,v|
      row = []
      @jsonBase[:cols].each do |c|
        if c[:id] == 'fib'
          row << {:v => k.to_s}
        elsif v.has_key? c[:id]
          num = v[ c[:id]]
          if num >= @treshold
            row << {:v => @treshold}
          else
            row << {:v => num}
          end
        else
          row << {:v => @treshold}
          # row << {:v => @maxValues[ c[:id]]}
        end
      end
       @jsonOut[:rows] << {:c =>row}
    end
    @jsonOut[:rows].sort! {|a,b| ("%3s" % a[:c][0][:v]) <=> ("%3s" % b[:c][0][:v])}
    makeHTML( JSON.generate(@jsonOut))
    puts "JSON: #{@jsonOut.inspect}"
  end
  
  def init_run_params
    @cases.each { |c| c.init_params }
  end
  
  def makeHTML(jsonV)
    require 'erb'
    maxValue = @treshold
    template = ERB.new <<-EOF
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
  <script src="https://www.google.com/jsapi" type="text/javascript"></script>
  <script>
    google.load('visualization', '1', {packages:['corechart']});

    google.setOnLoadCallback(drawTable);
    function drawTable() {
      var json_table = new google.visualization.LineChart(document.getElementById('table_div_json'));
      var json_data = new google.visualization.DataTable(<%= jsonV %>, 0.6);
      json_table.draw(json_data, {width: 1024, height: 768, title: "Fibonacci Benchmark", hAxis: {title: 'fib'}, vAxis: {title: 'time', maxValue: <%= maxValue %>, baseline: 0}});
    }
  </script>
  <body>
    <div id="table_div_json"></div>
  </body>
</html>
EOF
    File.open("fib_results.html", "w") do |f|
      f.puts template.result(binding)
    end
  end
  
end

class BenchCase
  
  attr_reader :name, :proc, :exectime, :total, :time, :average, :success, :failed, :points
  
  def initialize(name,l)
    @name = name
    @proc = l
    @exectime = 0.0
    @total = 0.0
    @points = 0
    init_params
  end
  
  def init_params
    @time = 0.0
    @average = 0.0
    @success = 0
    @failed = 0
  end
  
  def addTime(t)
    @time += t
  end
  
  def success!
    @success += 1
    average!
  end
  
  def failed!
    @failed += 1
    average!
  end
  
  def average!
    @average = @time / @success
  end
  
  def addTotal(r)
    @total += r
  end
  
  def addExectime(t)
    @exectime += t
  end
  
  def addPoints(n)
    @points += n
  end
  
end
