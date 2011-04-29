def combos(n, r, explored)
	(factorial(n, explored) / (factorial(r, explored) * factorial(n - r, explored)))
end
def factorial(n, explored)
	return 1 if n == 0
	return explored[n] if explored[n] != false
	return n * factorial(n - 1, explored)
end
explored = Hash.new{false}
sum = 0
for i in 23..100
	for j in 1..i
		result = combos(i, j, explored)
		sum += 1 if result > 1000000
	end
end
puts sum
