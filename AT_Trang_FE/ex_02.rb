def count_hours a
  array_val = a.split(':').map do |i|
    i.to_i if i.class === 'Fixnum'
  end
  p array_val
  if array_val.length != 3 || array_val.empty?
    p 'khong dung dinh dang'
  else
    length = array_val.length
    d = 0
    h = array_val.first
    m = array_val[1]
    s = array_val.last
    if s > 60
      m += s/60
      s = s%60
    end
    if m > 60
      h += m/60
      m = m%60
    end
    if h > 24
      d += h/24
      h = h%24
    end
    p d > 0 ? "#{d}day #{h}:#{m}:#{s}" : "#{h}:#{m}:#{s}"
  end
end

puts "Nhap time:"
a = gets.chomp

count_hours(a)