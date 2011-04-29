def generate(primes, totients, num = 1, chosen = [], index = 0)
	return if num > totients.size
	$count += 1
	puts $count if $count % 10000 == 0
	totients[num] = phi(chosen, totients)	
	for i in index...primes.size
		p = primes[i]
		num *= p
		return if num > totients.size
		chosen << p
		generate(primes, totients, num, chosen, i)
		chosen.pop
		num /= p
	end
end
def phi(nums, totients)
	result = Array.new
	i = 0
	while i < nums.size
		value = nums[i]
		chunk = 1
		while value == nums[i]
			chunk *= value
			i += 1
		end
		result << chunk
	end
	final = 1
	for r in result
		final *= totients[r]
	end
	return final
end
def anagrams(a, b)
	a.to_s.split("").sort == b.to_s.split("").sort
end
primes = Array.new(10000000){false}
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
totients = Array.new(10000000){false}
for i in primes
	puts i
	totients[i] = i - 1
	j = i ** 2
	k = i
	while j < totients.size
		puts j.to_s
		totients[j] = j - k
		k = j
		j = j * i
	end
end
$count = 0
generate(primes, totients)
min = 99999999
val = -1
perms = []
for n in 2...totients.size
	ratio = n * 1.0 / totients[n]
	min = ratio and val = n if ratio < min and anagrams(n, totients[n])
end
puts min
puts val
puts totients[val]
