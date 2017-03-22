require 'pry'
class Player
	attr_reader :name
	# attr_accessor :name, :total_score
	@@people = []
	def initialize(name, total_score)
		@name = name
		@total_score = total_score
		@@people << name
	end

	def self.people_names
		puts @@people
	end

	def greeting
		self
		puts "#{name}"
	end

	def name
		"abc"
	end
end

puts 'create player'
player = Player.new('Dy', 50)
puts 'create player'
player1 = Player.new('Kien', 10)
puts 'class method'
puts Player.people_names
puts 'instance method'
puts player.greeting