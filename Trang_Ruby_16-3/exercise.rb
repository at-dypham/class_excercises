require 'pry'
require 'benchmark'
#reject, hash.merge and merge!
#hash.delete(k){|k|
#block}
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
puts Benchmark.measure {
 puts (1..20).select{|item|
    item%3 == 0
  }.sum
}

puts (0..20).inject{|sum, n| n%3 == 0 ? sum+=n : sum}

puts Benchmark.measure {
sum=0
for i in 1..20
  sum += i if i%3 == 0
end
puts sum
}

m = {"a" => "b", b: "c", "b" => "d" }
#puts (1..100).inject{|sum, n| n%3 == 0 ? sum+=n : sum}
