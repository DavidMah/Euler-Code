def ruin(num, primes, goal)
	digits = num.to_s.split("").map{|x| Integer(x)}
	result = generate(num, [0] * digits.size, digits, primes, goal)
	return result == goal
end
def generate(num, slots, digits, primes, goal, index = 0, chosen = 0)
	return if chosen == slots.size
	result = trip_out(num, slots, digits, primes)
	return result if result == goal
	for i in index...slots.size
		next if slots[i] == 1
		slots[i] = 1
		result = generate(num, slots, digits, primes, goal, i, chosen + 1)
		slots[i] = 0
		return result if result == goal
	end
	return -1
end
def trip_out(num, slots, digits, primes)
	weirds = []
	for i in 0...slots.size
		weirds << i if slots[i] == 1
	end

	count = 0
	for i in 0..9
		temp = [0] * digits.size
		for j in 0...digits.size
			temp[j] = digits[j]
		end
		for w in weirds
			temp[w] = i
		end
		value = Integer(rZero(temp.join))
		count += 1 if primes[value]
	end
	return count
end
def rZero(s)
	return "4" if s[0] == "0"
	return s
end

primes = Array.new(1000000){false}
primetable = Hash.new{false}
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

for p in primes
	primetable[p] = true
end
for p in primes
	puts p
	puts p or break if ruin(p, primetable, 8)
end
