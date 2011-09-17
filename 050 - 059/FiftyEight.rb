def nextSide(start, increment, primetable)
	rate = [0, 0]
	num = start
	for i in 1..4
		num += increment + 1
		puts num
		rate[primetable[num] ? 0 : 1] += 1
	end
	return rate
end
primes = Array.new(300000000){0}
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
primes[0] = nil
primes[1] = nil
primes.compact!
for p in primes
	primetable[p] = true
end
side = 1
start = 1
increment = 1
rate = [0, 1]#account for 1
while true
	side += 1
	result = nextSide(start, increment, primetable)
	rate[0] += result[0] and rate[1] += 4
	puts rate[0].to_s + " / " + rate[1].to_s + ": " + (rate[0] * 1.0 / rate[1]).to_s
	break if rate[0] * 1.0 / rate[1] < 0.10
	start += 4 + 4 * increment
	increment += 2
end
puts (side * 2 - 1)
