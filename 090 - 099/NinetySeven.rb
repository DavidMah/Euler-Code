#puts (28433 * 2 ** 7830457 + 1) % 10000000000
result = 2
DIVISOR = 10 ** 13
for i in 1...7830457
	result *= 2
	result = result % DIVISOR
end
puts (result * 28433 + 1) % (10 ** 10)
