*******Daily Report*****

1. Review Hash : Hash of hashes

ex : hash {key1: "value1", key2: "value2", hash1: {key3: "value3"}}

2. Class in Ruby:

- Class used to define an object.

- Class name : camelCase or CameCase

- Creat a class : 

Class name 

. 

. 

.

end

- Initialize method :

Class People 

	def initialize(name, age)

		@name = name;

		@age = age;

	end
end

- Creating a New instance of a class :

people = People.new("Trang", 23)

- Class methods: only Class can use

def Peopel.name

end

- Variable in class :

+ Global variable: $variable_name

+ Clasa variable: @@variable_name

+ Instance variable : @variable_name

+ Local variable: variable_name

- Getter & Setter in Ruby :

+ attr_accessor: you can read and overwrite the value of variable

+ attr_reader: you only read

+ attr_write: you only overwrite


