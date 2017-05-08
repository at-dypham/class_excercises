def exercise2 n
		if n == 0
			puts "#{n} = 0"
		elsif n < 0
			puts "#{n} < 0"
		else
			print " = " + "  #{ (0..n).inject{|sum,j|
			if j==1
				print j
				sum += j
			else
				print "#{j}"
				sum += j
			end
			}}"
		end
end
	puts "Input n"
	n = gets.chomp.to_i
	exercise2(n)

			

