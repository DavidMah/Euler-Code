def factorial(n)
	return 1 if n == 0
	n * factorial(n - 1)
end
puts factorial(100).to_s.split("").map{|n| Integer(n)}.inject{|x, y| x + y}
