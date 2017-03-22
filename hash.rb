require "pry"
hash1 = {"a"=>"trang",a: "trang", subhash: {c: "anh", "a" =>"abv"}}
# binding.pry
hash_array=[]
hash1.map { |k,v|
 if v.class.to_s == "Hash"
    v.map { |sk, sv|
      puts "#{sk} #{sv}" if sk.to_s == "a"
    }
 else
   puts "#{k} #{v}" if k.to_s == "a"
  end
}
# puts hash_array.to_a
