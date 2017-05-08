require "pry"
hash1 = {
  'name' => "trang",
  name: "trang",
  subhash: {
    name: "anh"
  } 
}
hash_array = []
hash1.map { |key,value|
  h = {}
  #binding.pry
  if value.class.to_s == "Hash"
    value.map { |subkey, subvalue|
      h[subkey] = subvalue
      hash_array << h  if subkey.to_s == "name"
    }
  else
    h[key] = value
    hash_array << h  if key.to_s == "name"
  end
}
puts hash_array
puts hash_array.class 
puts hash_array[0].class   