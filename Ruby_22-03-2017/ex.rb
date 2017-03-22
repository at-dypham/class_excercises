require "pry"
h = { "name" => "trang",
  :name => "tnkt",
  subhash: {
    "name" => "abc",
    name: "abcdef"
  }
}
result = []
h.map{|k, v|
  if v.is_a?(Hash)
    v.map{|sk, sv|
     h  = { sk => sv}
     result.push h
   }
 else
  h  = { k => v}
  result.push h
end
}
puts result