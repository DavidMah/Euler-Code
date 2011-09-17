def piles(n, previous = 1, cache = Hash.new{false})
	return 1 if n == 0
	return cache[[n, previous]] if cache[[n, previous]] != false
	ways = 0
	for i in previous..n
		ways += piles(n - i, i, cache)
	end
	cache[[n, previous]] = ways
	return ways
end
count = 1
cache = Hash.new{false}
while true
	n = piles(count, 1, cache)
	puts count.to_s + ": " + n.to_s
	break if n % 1000000 == 0
	count += 1
end
puts n
