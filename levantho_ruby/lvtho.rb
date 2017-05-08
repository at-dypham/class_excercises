require "pry"
require 'benchmark'

a = [1,2,3]
puts a.first

puts Benchmark.measure{
 [1..1000].size
}
puts Benchmark.measure {
 [1..1000].length
}
class Object
  def hello
    puts "hello"
  end
end
nil.hello

arr = [{id: 10, name: "lvtho"}, {id: 11, name: "lvtho1"}, {id: 12, name: "lvtho2"}]
puts arr.select { |user|
  if user.class.to_s == "Array"
    user.detect{
      |d| d[:id] > 10
    }
  else
    user[:id] > 10
  end
}

arr = ["hello",2,3,4,"world"]
puts Benchmark.measure {
  arr.map!{|arr1| puts arr1}
}
puts Benchmark.measure {
  arr.each do |arr2|
    puts arr2
  end
}
