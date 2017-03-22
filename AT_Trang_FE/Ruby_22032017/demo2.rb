require 'pry'
hash = {name: "Trang", name: "Name", subhash: {name: "Anh"}}
arr = []
hash.collect do |k,v|
	if v.class.to_s = "Hash"
		v.collect do |i,j|
			j.class.to_s = "Hash"	
    end
    if k == "name"
      h= {k => v}
      arr.push(h)
    end

  end
end
puts arr.uniq