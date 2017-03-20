def test()
  begin
    puts " Array 1:"
    arr1 = gets.chomp.split(' ')
    puts "Array 2:"
    arr2 = gets.chomp.split(' ')
    arr_result = []
    arr2.each do |st2|
      arr1.each do |st1|
        arr_result << st1 if st2.include? st1
      end
    end
    puts "arr_result =#{arr_result}"
  rescue Exception => e
    if arr1.strip.empty? || arr2.strip.empty?
      puts "Array khong duoc de trong"
    end
    retry
  end
end
test()