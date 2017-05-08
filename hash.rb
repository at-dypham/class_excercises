a = {"name" => "anh"}
b = {"name" => "anh", name: "ABC"}

puts b["name"]
puts b[:name]

m = Hash.new
puts m

months = Hash.new (month: "2")
puts months