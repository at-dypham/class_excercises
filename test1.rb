puts [{id: 10},{id: 11},{id: 9},[{id: 12},{id: 8}]].select{|us| 
	if us.class.to_s == "Array" 
		us.detect{|d|
			d[:id]>11 
		}.length > 0  
	else 
		us[:id] > 11 
	end
}