require "pry"
h = { "name" => "trang",
  :name => "tnkt",
  subhash: {
    "name" => "abc",
    name: {"name2" => "abcdef",
      name2: "1234",
      name22: {sublv3: "sub3",
        sub4: "sub4"
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
    result.push  (v.is_a?(Hash)) ? dequy(v) : { k => v}
  }
  return result
end
result = []
h.map{|k, v|
 result.push  (v.is_a?(Hash)) ? dequy(v) : { k => v}
}
puts result