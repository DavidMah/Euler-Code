def checkProperty(num, primes)
	for i in 4..10
		current = num / (10 ** (10 - i))
		current = current %  1000
		return false if not current % primes[i - 4] == 0
	end
	return true
end
def generatePandigitals(num, chosen, positions)
	puts num if chosen == 2
	return [num] if chosen == 10
	results = []
	for i in 0...positions.size
		next if positions[i] == 1
		positions[i] = 1
		num += i * (10 ** chosen)
		results = results + generatePandigitals(num, chosen + 1, positions)
		num -= i * (10 ** chosen)
		positions[i] = 0
	end
	return results
end
pans = generatePandigitals(0, 0, [0] * 10)
primes = [2, 3, 5, 7, 11, 13, 17]
sum = 0
for p in 0...pans.size
	puts p if p % 100000 == 0
	sum += pans[p] if checkProperty(pans[p], primes)
end
puts sum

