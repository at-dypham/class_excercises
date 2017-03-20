*********Daily Report********

I. Strings

Strings in Ruby contain an sequence enclosed in ' ' or " " 

ex : str = 'abc'

Methods in string : 

- str * integer : Returns a new string containing integer

Ex: '12aaa'*integer => 12

- str << obj : Concatenates an object to str

Ex: 'aaa' << 'bbb' => 'aaabbb'

- str.gsub(pattern, replacement) [or] str.gsub(pattern) { |match| block }: Returns a copy of str with all occurrences of pattern replaced with either replacement or the value of the block.

- str.include? other_str [or] str.include? fixnum : Returns true if str contains the given string or character.

Ex: 'aabbcc'.include? 'aa' => true

- str.insert(index, other_str) : Inserts other_str before the character at the given index

Ex: 'aassdd'.insert(0,'ss') => 'ssaassdd'

- str.reverse : Returns a new string with the characters from str in reverse order

Ex: 'aassdd'.reverse => 'ddssaa'

II. Block vs Proc vs Lambda

1. Block vs Proc:

- procs are objects, blocks are not

- at most one block can appear in an argument list

2. Proc vs Lambda

- When execute the statement, lambdas check the number of arguments, procs don't

- When treat the ‘return’ keyword, lambdas still run the following commands, proc don't

