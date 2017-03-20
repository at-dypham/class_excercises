class Integer
	def times
		(0.."#{sefl}".to_i) do
			yield
		end
	end
end

2.times {puts "abc"}