lam = lambda{|x| 
	return 2
	puts x*2
}

proc1 = Proc.new do |x| 
	return 3
	puts x
end
#puts proc1.call(2)

puts [1,2,3].each(&lam)

#lam = lambda { puts "Hello" }
#lam.call