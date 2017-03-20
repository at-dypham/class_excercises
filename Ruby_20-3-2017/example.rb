def input
  
  begin
    str = gets.chomp
    if str.length < 5
        raise "min length is 5, please input again"
    end
  rescue => e
    puts "Error: #{e}"
    retry
  end
  return str
end

puts "input str1"
str1 = input
puts "input str2"
str2 = input
puts str1.length < str2.length ? "#{str1}#{str2}#{str1}" : "#{str2}#{str1}#{str2}"