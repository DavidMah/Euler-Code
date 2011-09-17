def find_x(d, squares)
	return -1 if squares[d * 1.0]
	x = 2
	while true
		puts "\t" + d.to_s + " - " + x.to_s if x % 10000 == 0
		y = ((x ** 2.0) - 1.0) / d
		puts y.to_s + " - " + x.to_s if squares[y]
		return x if squares[y]
		x += 1
	end
end
squares = Hash.new{false}
for i in 1..100000
	squares[i ** 2.0] = true
end

best = -1
index = -1
for d in 2..1000
	puts d
	x = find_x(d, squares)
	index = d and best = x if x > best
end
puts index
puts best.to_s
