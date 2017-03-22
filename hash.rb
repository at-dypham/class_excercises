require "pry"
hash1 = {
  'name' => "trang",
  name: "trang",
  subhash: {
    name: "anh"
  } 
}
hash1.map { |key,value|
  # binding.pry
  if value.class.to_s == "Hash"
    value.map { |subkey, subvalue|
      puts "#{subkey} #{subvalue}" if subkey.to_s == "name"
    }
  else
    puts "#{key} #{value}" if key.to_s == "name"
  end
}    