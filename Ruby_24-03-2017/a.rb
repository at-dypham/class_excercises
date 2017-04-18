require "pry"

# class A
#   def abc name
#   puts = name
#   end
# end

# module B
#   def self.hello
#     puts "hello"
#   end
#   def helloe
#     puts "abc"
#   end
# end

# class C < A
#   extend B
#  end
# binding.pry
# class A 
#   public
#   def a
#     puts "a"
#   end

# end

class Some
     
    def initialize
        method1
    end
 
    protected
     
     def method1
         puts "protected method1 called" 
     end
            
end
 
 
s = Some.new.method1()





