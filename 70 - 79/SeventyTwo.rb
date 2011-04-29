def generate(primes, totients, num = 1, nums = [], index = 0)
	return if num >= totients.size
	$count += 1
	puts $count
	totients[num] = phi(nums, totients)
	for p in index...primes.size
		i = primes[p]
		num *= i
		return if num > totients.size
		nums << i
		generate(primes, totients, num, nums, p)
		nums.pop
		num /= i
	end
end
def phi(nums, totients)
	i = 0
	results = []
	while i < nums.size
		value = nums[i]
		chunk = 1
		while value == nums[i]
			chunk *= value
			i += 1
		end
		results << chunk
	end
	final = 1
	for r in results
		final *= totients[r]
	end
	return final;
end
primes = Array.new(1000001){false}
totients = Array.new(primes.size){false}
for i in 2...primes.size
	next if primes[i] == nil
	primes[i] = i
	totients[i] = i - 1
	j = i * 2
	while j < primes.size
		primes[j] = nil
		j += i
	end
	j = i ** 2
	k = i
	while j < primes.size
		totients[j] = j - k
		k = j
		j *= i
	end
end
$count = 0
primes[0] = nil or primes[1] = nil or primes.compact!
generate(primes, totients)
puts "damnit"
total = 0
for i in 2...totients.size
	t = totients[i]
	total += t
end
puts total.to_s
