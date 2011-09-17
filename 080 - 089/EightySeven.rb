def analyze(table, cap, squares, cubes, fourths)
	total = 0
	for s in squares
		for c in cubes
			break if s + c >= cap
			for f in fourths
				sum = s + c + f
				break if sum >= cap
				total += 1 if not table[sum]
				table[sum] = true
			end
		end
	end
	return total
end
CAP = 50000000
primes =  Array.new(Math.sqrt(CAP).to_i + 30){false}
for i in 2...primes.size
	next if primes[i] == nil
	primes[i] = i
	j = i * 2
	while j < primes.size
		primes[j] = nil
		j += i
	end
end
primes[0] = nil or primes[1] = nil or primes.compact!
squares = []
cubes = []
fourths = []
for p in primes
	square = p ** 2
	break if square > CAP
	squares << square
	
	cube = square * p
	next if cube > CAP
	cubes << cube

	fourth = cube * p
	next if fourth > CAP
	fourths << fourth
end

table = Hash.new{false}
puts analyze(table, CAP, squares, cubes, fourths)
