puts "Input number: "
n= gets.chomp.to_i
def sum n

  if (n>0) 
    a= (1..n).inject { |sum, n| sum + n }
    for i in 1..n-1
      print "#{i} + "
    end
    puts n.to_s + " = " + a.to_s
  else puts "0=0"
      
  end
end
sum(n)