require 'benchmark'
#Monkey patching ===>>>
#collect, map, select,detect

#puts Benchmark.measure { "a"*1_000_000 }
#a=[nil]
b = [1,2,3,4  ]
# puts b.values_at(1)
# puts b.last
# puts b.slice(-1)

#a = Array.new
#puts a.size()

#a_s = Array.new(20)
#puts a_s.size()

#a_v = Array.new(1000)

#puts Benchmark.measure { puts a_v.size }

#puts Benchmark.measure { puts a_v.length }
class Object
  def hello
    puts "hello"
  end
end
# b.select{|item| 
#   puts item > 1
# }
#  [{id: 10},{id: 11},{id: 9},[{id: 12},{id: 8}]].select{|us|
#   if us.class.to_s == "Array"
#     us.detect{|d|
#       d[:id]>11
#       puts d[:id]
#       }.length > 0
#     else 
#       us[:id] > 11
#        puts us[:id] 
#     end
#   }
puts b.at(3)



