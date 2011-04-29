def check(n, primes, squares)
	for p in primes
		break if p > n
		for s in squares
			break if s > n
			puts p.to_s + " " + s.to_s if n == p + s
			return false if n == p + s
		end
	end
	return true
end
def calculatePrimes
	primes = Array.new(1000000){0}
	count = 0
	for i in 2...primes.size
		next if primes[i] == nil
		primes[i] = i
		j = i * 2
		while j < primes.size
			primes[j] = nil
			j += i
		end
	end
	primes[0] = nil
	primes[1] = nil
	primes.compact
end
def calculateDoubleSquares
	squares = Array.new(100000)
	for i in 0...squares.size
		squares[i] = (i ** 2) * 2
	end
	squares
end
primes = calculatePrimes
squares = calculateDoubleSquares
odd = 3
while true
	puts odd
	break if check(odd, primes, squares)
	odd += 2
end
puts odd
