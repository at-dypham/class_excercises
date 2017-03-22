require "pry"
h = { "name" => "trang",
  :name => "tnkt",
  subhash: {
    "name" => "abc",
    name: {"name2" => "abcdef",
      name2: "1234",
      name22: {sublv3: "sub3",
        sub4: "sub444"
      }
      },
      sub2: 123

    }
  }
# def check_hash(h)
#   result = []
#   h.map{|sk, sv|
#    result << {sk => sv}
#  }
#  return result
# end
def dequy(h)
  result = []
  h.map{|k, v|
    if v.is_a?(Hash)
      result << dequy(v)
    else
      result << { k => v}
    end
  }
  return result
end
result = []
h.map{|k, v|
  if v.is_a?(Hash)
   result << dequy(v)
 else
  result << { k => v}
end
}
puts result