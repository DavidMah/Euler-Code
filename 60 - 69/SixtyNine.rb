def generate(primes, totients, num = 1, index = 0, nums = [])
	#puts num.to_s
	totients[num] = phi(nums, totients)
	$count += 1
	puts $count
	for p in index...primes.size
		num *= primes[p]	
		return if num > totients.size
		nums << primes[p]
		generate(primes, totients, num, p, nums)
		num /= primes[p]
		nums.pop
	end

end
def totient(num, primes, totients)
	nums = []
	for p in primes
		while num % p == 0
			nums << p
			num /= p
		end
		break if num == 1
	end
	return phi(nums, totients)
end
def phi(nums, totients)
	all = package(nums)
	result = all.map{|x| totients[x]}.inject{|x, y| x * y}
	#puts result
	return result
end
def package(nums)
	return [] if nums.size == 0
	batches = []
	n = 0
	while n < nums.size
		current = nums[n]
		count = 1
		while current == nums[n]
			count *= nums[n]
			n += 1
		end
		batches << count
	end
	return batches
end
primes = Array.new(1000001){false}
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
totients = Array.new(1000001){false}
for p in primes
	puts p
	totients[p] = p - 1
	j = p ** 2
	k = p
	while j < totients.size
		puts j
		totients[j] = j - k
		k = j
		j = j * p
	end
end
$count = 0
generate(primes, totients)
best = 0
index = 0
for n in 2...totients.size
	val = n * 1.0 / totients[n]
	best = val and index = n if val > best
end
puts index
puts totients[index]
