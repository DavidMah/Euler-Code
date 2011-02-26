def writeable?(n, primes)
	current = 0
	bottom = 0
	sum = 0
	while primes[current] < n
		sum += primes[current]
		return (current - bottom) if sum == n
		sum -= primes[bottom] and bottom += 1 if current > n
		current += 1
	end
	return false
end
CAP = 1000000
primes = Array.new(CAP){true}
for i in 2..CAP
	next if primes[i] == nil
	puts i
	primes[i] = i
	j = i * 2
	while j < CAP
		primes[j] = nil
		j += i
	end
end
primes.compact!
primes = primes.drop(2)
for p in primes
	result = writeable?(p, primes)
	puts p.to_s + " " + result.to_s if result != false
end

