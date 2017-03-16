#ex 1
a = ['Hello', 2, 3, 4, 'World']
a.map{|item| puts item}

#ex 2

b = [1,2,3,4,5,6,7,8,9,10]
puts b.inject{|sum,item| 
	item%2==0 ? sum+=item : sum
}


#ex3
puts (1..100).inject{|sum,n|
	n%3==0 ? sum+=n : sum
}
