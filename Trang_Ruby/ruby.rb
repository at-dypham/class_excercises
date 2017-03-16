require 'benchmark'

#puts Benchmark.measure { "a"*1_000_000 }
a=[nil]
b = [1,2,3,4]
puts b.values_at(1)
puts b.last
puts b.slice(-1)

