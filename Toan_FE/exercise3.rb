def exercise3 n
	(n).map { |i|  
		(n).detect {|j| print "#{i}=======" if j*j == i }
		}	
end


exercise3(1..100)