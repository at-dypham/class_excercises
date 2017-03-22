def sls_string
	begin
		string1 = gets.chomp
		string2 = gets.chomp
		raise 'Error input' if string1.length < 5 || string2.length < 5
	rescue
		puts "Length is smaller than 5"
		retry
	end
end
sls_string