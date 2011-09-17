def count(remaining, index, possibilities)
	return 1 if index == possibilities.size - 1
	total = 0
	taken = possibilities[index] * 0
	while taken <= remaining
		total += count(remaining - taken, index + 1, possibilities)	if not index == possibilities.size - 1
		taken += possibilities[index]
	end
	return total
end
puts count(200, 0, [200, 100, 50, 20, 10, 5, 2, 1])
