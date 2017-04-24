#2 vis du ve block code cua view helper rails,sum
def input
  begin
    str = gets.chomp
    if str.length < 5
      raise "min length is 5, please input again"
    end
  rescue => e
    puts "Error: #{e}"
    retry
  end
  return str
end

def ex1
  puts "input str1"
  str1 = input
  puts "input str2"
  str2 = input
  puts str1.length < str2.length ? "#{str1}#{str2}#{str1}" : "#{str2}#{str1}#{str2}"
end

a= Proc.new do 
  puts "a"
end

def test1(&a)
  puts a
end

mut = Proc.new do |b|
  b%3 == 0
end

def call_procs(p1, p2)
  p1.call
  p2.call
end
a = Proc.new do puts "First proc" end
 b = Proc.new { puts "Second proc" }

  lam = lambda { |x| 
    puts x
    return x=x*3
    return "abc"
  }
  #(1..3).each(&lam)
  def t
    pr = Proc.new do|x,y,z|
      return 3
    end
    puts pr.call
  end
  puts t
  #pr.call(2)
