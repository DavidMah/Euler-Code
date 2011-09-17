def chain(n, recall, cache = Hash.new{false})
	return 0 if cache[n] == true
	sum = n.to_s.split("").map{|x| factorial(Integer(x), recall)}.inject{|x, y| x + y}
	cache[n] = true
	return 1 + chain(sum, recall, cache)
end
def factorial(n, recall)
	return 1 if n == 0
	return recall[n] if recall[n] != false
	recall[n] = n * factorial(n - 1, recall)
	return recall[n]
end
recall = Hash.new{false}
total = 0
for i in 1...1000000
	puts i if i % 10000 == 0
	total += 1 if chain(i, recall) == 60
end
puts total
