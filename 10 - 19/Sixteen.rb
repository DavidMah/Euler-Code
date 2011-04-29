number = 2 ** 1000
puts number.to_s.split("").map{|n| Integer(n)}.inject{|x, y| x + y}
