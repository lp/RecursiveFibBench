class Bencher
  require 'benchmark'
  
  def initialize(incr,treshold,&block)
    @results = ""
    @treshold = treshold
    @incr = incr
    @actual = 0
    @cases = Array.new
    @fails = Array.new
    
    block.call.each do |c|
      @cases << BenchCase.new(c[0],c[1])
    end
    @yard = @cases.length
  end
  
  def run(*rang)
    rang = [1] if rang == []
    
    while (@cases.length > 0) do
      @actual += @incr
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
          
          if rez >= @treshold
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
  end
  
  def init_run_params
    @cases.each { |c| c.init_params }
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