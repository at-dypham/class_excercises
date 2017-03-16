require 'benchmark'
a = [nil]
b =[1,2,3]
[1,2].methods

arrays = ['a',3,3.4,'hello']
puts arrays[0]
puts arrays[1]
puts.arrays[-1]

arrays Array.new
puts.arrays.size
array_with_size = Array.new(20) 
put array_with_size

array_with_size = ['hello world' , 2,10,5]
puts array_with_value.size
multi_arrays = [["",""],["",""],["",""]]
puts multi_arrays.size


class Object

	def hello
		puts "hello"
	end
end

#example ve` select detect
puts [{id: 10},{id: 11},{id: 9},[{id: 12},{id: 8}]].select{|us|
  if us.class.to_s == "Array"
    us.detect{|d|
      d[:id]>11
    }.length > 0
  else 
    us[:id] > 11 
  end
}
#exercise 1:arrays = ['Hello', 2,3,4,'world']
arrays = ['Hello', 2,3,4,'world']
arrays.map { |a|
	puts a
  }
	


#exercise 2: arrays = [1,2,3,4,5,6,7,8,9,10]
arrays = [1,2,3,4,5,6,7,8,9,10]
ex2_arr = arrays.select{[ex2]
	puts ex2.odd?
}
puts
ex2_arr.injectinit(0) { |sum, x| sum + x  }


#exercise 3: arrays = [1..100]
a= (1..100).inject{|sum, n| n%3 == 0 ? sum+=n : sum}
puts a
#    HASHES

months = Hash.new 
puts months

months = Hash.new months(months: 2)
puts months
