mul_of_3 = Proc.new do |n|
	n % 3 == 0
end
#puts (1..10).to_a.select(&mul_of_3)

def mul_proc(proc1, proc2)
	proc1.call
	proc2.call
end
a = Proc.new do puts "First proc" end
b = Proc.new { puts "2nd proc" }
#mul_proc(a,b)
