def chain(num, cache)
	return cache[num] if cache[num] != false
	return num if num == 1 or num == 89
	result = chain(num.to_s.split("").map{|x| Integer(x) ** 2}.inject{|x, y| x + y}, cache)
	cache[num] = result
	return result
end
total = 0;
cache = Hash.new{false}
for i in 1..9999999
	puts i if i % 100000 == 0
	total += 1 if chain(i, cache) == 89
end
puts total
