def test(a, b)
	result = b * Math.sqrt((4.0 * (a ** 2) - (b ** 2)) / 4.0)
	return result.to_i == result ? (a + a + b) : 0
end
a = 2
result = 0
perim = 0
while perim < 1000000000
	puts perim if a % 100000 == 0
	result += test(a, a + 1)
	result += test(a, a - 1)

	a += 1
	perim = a + a + a - 1
end
puts result
