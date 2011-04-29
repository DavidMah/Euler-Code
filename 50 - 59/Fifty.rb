def findLongest(num, primes)
	sum = 0
	count = 0
	smallest = 0
	for p in primes
		break if p > num
		return count if sum == num
		sum += p
		count += 1
		while sum > num
			sum -= primes[smallest]
			count -= 1
			smallest += 1
		end
	end
	return count
end
$primes = Array.new(999999){0}
for i in 2...$primes.size
	next if $primes[i] == nil
	$primes[i] = i
	j = i * 2
	while j < $primes.size
		$primes[j] = nil
		j += i
	end
end
$primes[0] = nil
$primes[1] = nil
$primes.compact!
max = 0
best = 0
for p in $primes
	result = findLongest(p, $primes)
	puts p if not max > result
	best = max > result ? best : p
	max = max > result ? max : result
end
puts best.to_s + " - " + max.to_s
