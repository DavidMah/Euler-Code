def generate(primes, table, index = 0, current = [], sum = 0)
	puts index or $bestIndex = index if index > $bestIndex
	table[sum] = table[sum] + 1
	for i in index...primes.size
		sum += primes[i]
		return if sum > 4000
		current << primes[i]
		generate(primes, table, i, current, sum)
		current.pop
		sum -= primes[i]
	end
end
primes = Array.new(1000000){false}
for i in 2...primes.size
	next if primes[i] == nil
	primes[i] = i
	j = i * 2
	while j < primes.size
		primes[j] = nil
		j += i
	end
end
$bestIndex = 0
primes[0] = nil or primes[1] = nil or primes.compact!
table = Hash.new{0}
generate(primes, table)
puts table.to_a.reject{|x| x[1] < 5000}.map{|x| x[0]}.sort
