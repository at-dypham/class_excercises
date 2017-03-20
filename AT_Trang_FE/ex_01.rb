require 'pry'
def test(pass)
	validate = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])[A-Za-z0-9]{6,}$/
	(pass =~ validate) ? "Pass dung dinh dang" : "Pass sai dinh dang"
end
puts "Input pass"
pass = gets.chomp
puts test(pass)