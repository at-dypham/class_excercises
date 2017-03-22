require "pry"
hash={ name: "conga",
 name_v: "convit",
 subhash:{
  name: "anh"
}
}
# subhash = {name: "anh"}
arr =[]
hash_1 = {}
hash.collect do |a,b|
  if b.class.to_s == "Hash"
    arr<<(b)
  else
    hash_1[a] = b
    arr << hash_1
  end
end
print arr.uniq
puts
