def count(n, previous, cap = n, cache = Hash.new{false})
	return cache[[n, previous, cap]] if cache[[n, previous, cap]]
	return 1 if n == 0
	ways = 0
	for i in previous..n
		next if i == cap
		ways += count(n - i, i, cap, cache)
	end
	cache[[n, previous, cap]] = ways
	return ways
end
puts count(100, 1)
