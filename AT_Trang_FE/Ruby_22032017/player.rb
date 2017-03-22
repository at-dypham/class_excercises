require 'pry'
class Player
	binding.pry
	attr_reader :name
	# attr_accessor :name, :total_score
	@@people = []
	def initialize(name,total_score)
		@name = name
		@total_score = total_score
		@@people << name
	end
	
	def self.people_names
		puts @@people
	end
	binding.pry
	def greetting
		self
		puts "#{name}"
	end
	def name
		"aaa"
	end
end
player = Player.new('Dy',50)
player1 = Player.new('Kien',20)
puts Player.people_names
puts player.greetting