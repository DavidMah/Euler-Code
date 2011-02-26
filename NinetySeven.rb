puts (28433 * 2 ** 7830457 + 1) % 10000000000
result = 28433
for i in 1..7830457
	result *= 2
	result = result % 10000000000
end
puts result
