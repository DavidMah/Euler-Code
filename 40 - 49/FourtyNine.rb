def trySequence(p, primes, table)
	return false if primes[p] == 1487
	master = primes[p]
	for i in (p + 1)...primes.size
		second = primes[i]
		difference = second - master
		third = table[second + difference] ? second + difference : false
		next if not third
		perm = permutable?(master, second, third)
		next if not perm
		puts master.to_s + second.to_s + third.to_s if perm
		return true if perm
	end
	return false
end
def permutable?(a, b, c)
	a.to_s.split("").sort == b.to_s.split("").sort and b.to_s.split("").sort == c.to_s.split("").sort
end
primes = Array.new(9999){0}
table = Hash.new
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
primes.reject!{|p| p < 1000}
primes.each{|p| table[p] = true}
for i in 0...primes.size
	result = trySequence(i, primes, table)
	break if result
end
