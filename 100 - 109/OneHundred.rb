def calculate(n)
	c = n ** 2 - n
	mid = Math.sqrt(1 + 2 * c)
	result = (1 + mid) / 2
	return result if result % 1 == 0
	return -1
end
i = 10 ** 11
while true
	#puts i if i % 100000 == 0
	result = calculate(i)
	puts result.to_s + " - " + i.to_s if result != -1
	i += 1
end
