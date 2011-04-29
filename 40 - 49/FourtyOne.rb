def isPrime(n)
	current = 2
	while current < (n / 2 + 1)
		return false if n % current == 0
		current += 1
	end
	return true
end
def generatePandigitals(num, chosen, positions)
	$pandigitals << num if chosen == positions.size
	return if chosen == 9
	for i in 0...(positions.size)
		next if positions[i] == 1
		positions[i] = 1
		num += (i + 1) * (10 ** chosen)
		generatePandigitals(num, chosen + 1, positions)
		num -= (i + 1) * (10 ** chosen)
		positions[i] = 0
	end
end
$pandigitals = Array.new
generatePandigitals(0, 0, [0] * 9)
generatePandigitals(0, 0, [0] * 8)
generatePandigitals(0, 0, [0] * 7)
generatePandigitals(0, 0, [0] * 6)
$pandigitals = $pandigitals.sort.reverse
for p in $pandigitals
	prime = isPrime(p)
	puts p if prime
end
