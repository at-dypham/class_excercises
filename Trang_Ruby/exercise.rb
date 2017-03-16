require 'benchmark'
puts "===========EX1============"
arr1 = ["hello",2,3,4,"world"]
arr1.map{|item| 
#  puts item
}
puts "===========EX2============"
#EX2
puts Benchmark.measure {
arr2 = [1,2,3,4,5,6,7,8,9,10]
puts  arr2.select{|item| 
 item.odd?
}.sum
#puts arr_sum.inject(0){|sum,x| sum + x }
}
puts "===========EX3============"
#EX3

puts Benchmark.measure {(1..1000).inject{|sum,n|
 sum.to_i + n if n%3 == 0  
} 
}
