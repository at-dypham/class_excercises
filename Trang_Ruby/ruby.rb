require 'benchmark'

#puts Benchmark.measure { "a"*1_000_000 }
a=[nil]
b = [1,2,3]
puts b.values_at(1)
puts b.last

