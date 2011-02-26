numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
numbers.map!{|x| x.to_s}
numbers = numbers.permutation(10)
numbers = numbers.map{|x| x.join}
numbers.sort!
puts numbers.size
puts numbers[999999]
