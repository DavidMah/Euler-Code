squares = []
for i in 1..9
	squares << i ** 2
end
squares.map{|s| [s / 10, s % 10]}
