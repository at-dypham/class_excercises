ARRAY
	Array syntax:
		ex_array = ["String", 1, "Name", 25, "Age"]
	Add to Array:
		ex.array.push("string") Or ex_array<<"string"
	Iterating over Array:
		ex_array {|i| puts i}
	Select Items from an Array:
		Elements can be selected from an array according to criteria defined in a block.
		example:
		a = [1,2,3,4]
		a.select{|n| n > 2}

		Result = [3, 4]
	Reject Items from an Array:
		It else select items.

		example:
		a = [1,2,3,4]
		a.select{|n| n > 2}

		Result = [1, 2]

	Destructive : Can reuturn element with condition.
		example:
			a = [1,2,3,4]
			a.detect {|n| n == 3}

			Result = 3
	Collect items :
		It return a array with condition.

		example:
			a = [1,2,3,4]
			a.collect {|n| n*n}
		result =[1, 4, 9, 16]

	 Inject items:
		It support for you a variable.
		example:
			a = [1,2,3,4]
			a.inject(10) {|acc,n| acc + n}
		result = 20




