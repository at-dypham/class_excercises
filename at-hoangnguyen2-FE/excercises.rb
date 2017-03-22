# # puts 'abc&a=5&c=3'.gsub(/[&a]= | [&c]=/, '&a' => "abc", '&c' => "abc")


# str= 'aabcdabcaa'
# # count = 0
# # str.colect{ |i| count+=1 if (str.at(i)+ str.at(i+1)).include? "aa" == true}
# # str.insert(0,"123")
# # puts str

# # puts str.to_i(base =2)


# a.count "lo"

# def input(a, b)
#   count_a = a.length
#   count_b = b.length

#   if count_a > count_b
#     puts b +" "+ a +" "+ b
#   else
#     puts a +" "+ b +" "+ a
#   end
# end

# input "22", "1"

# class Integer
#   def times
#     (1.."#{sefl}".to_i).each do
#       yield
#     end
#   end
# end
# puts 1.times{ puts "con ga"}

a = Proc.new do
  puts 'abc'
end
# def test (a)
#   a.call
# end


# multiples_of_3  = Proc.new  do  |n|
#         n % 3 ==  0
# end
# (1..100).to_a.select(&multiples_of_3)



# def mu_pro(proc1,proc2)
#   proc1.call
#   proc2.call
# end

# a =Proc.new {puts "proc 1"}
# b =Proc.new {puts "proc 2"}



# mu_pro(a,b)

# lam = lambda do |x|
#     puts x*2
#   return 'a'
#     puts x*3
# end
# [1,2,3].each(&lam)

# lam = lambda { puts "Hello World" }
# puts lam.call

def test
  proc_1 = Proc.new do |x,y,z|
    puts "con ga"

    return x

    puts "bo co ga"
  end
 puts proc_1.call
end
test


# puts proc_1.call(2)
# def meditate
#     puts "Adjusting posture…"
#     p = Proc.new { puts "Ringing bell…"; return }
#     p.call
#     puts "Sitting still…"  # This is not executed
# end
# meditate
























