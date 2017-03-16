puts "Input number"
n=gets.to_i
def so_chinh_phuong n
	(1..n).map { |i|  
		(1..n).detect {|j| puts "#{i}" if j*j == i }
		}	
end
so_chinh_phuong(n)
