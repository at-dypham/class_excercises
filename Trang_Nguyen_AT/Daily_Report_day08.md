*************DAILY REPORT**************

I. ARRAY: can be used to store a list of values in a single variable.

Ex: [1, 2, 3, 4, 5]

- Array on rails don't difference data type.

- Creat array : 

arr =[] or arr = Array.new or Array =[1, 2,..., n]

- Access an element into array :

arr = [1, 2, 3, 4, 5]

arr[0] #return 1

arr[1,3] #return [2, 3, 4]

- Insert an element to the end of array:

arr.push(n)

arr << n

- Insert an element to the beginning of array:

arr.unshift(n)

- Insert an element to anywhere in array:

arr.insert(i,n) 

- Delete the last element of array:

arr.pop

-  Delete the first element of array:

arr.shift

- Delete regardless of the location of the array.

a.delete_at(i)

- Delete specific value

arr.delete(n)

- Other methods in array:

array=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

+ arr.reverse #reverse elements in array: [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

+ arr.each do |a| 

	puts "#{a}" 

end 

#returns 1! 2! 3! 4! 5! 6! 7! 8! 9! 10!

+ arr.map{|a| a + 2} # returns [3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

+ arr.select {|a| a > 7} #returns [8, 9, 10]

+ arr.reject {|a| a < 8} #returns [9, 10]

+ arr.length = 10

II. HASH: Hashes are a collection of key-value pairs. Keys are the names of the	values. Values are assigned	to keys	using the => operator, called a	hash-rocket.

Ex: hash = {"dog"=>"cho","cat"=>"meo"}

Some methods in hash :

- Merge: 

h1 = { "a" => 100, "b" => 200 }

h2 = { "b" => 250, "c" => 300 }

h1.merge(h2)   #{"a"=>100, "b"=>250, "c"=>300}

- Reject 

{ a: 'first', b: '', c: 'third' }.reject { |k,v| v.empty? } #=> {:a=>"first", :c=>"third"}

- Delete 

h = { "a" => 100, "b" => 200 }

h.delete("a") # 100

- Select

h = { "a" => 100, "b" => 200, "c" => 300 }

h.select {|k,v| v < 200}  # {"a" => 100}



