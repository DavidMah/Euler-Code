def primeable?(p, primed, tried)
	return false if p == (["$"] * p.size)
	full = p.kind_of?(Integer) ? p.to_s.split("") : p
	for i in 0...full.size
		next if full[i] == "$"
		temp = full[i]
		full[i] = "$"
		return true if try(full, primed, tried) == 8
		return true if primeable?(full, primed, tried)
		full[i] = temp
	end
	return false
end
def try(spots, primed, tried)
	return tried[spots.to_s] if tried[spots.to_s] != -1
	count = 0
	for i in 0..9
		intermediate = Integer(removeLeadingZeroes(spots.map{|x| x == "$" ? i : x}.join))
		count += 1 if primed[intermediate]
	end
	tried[spots.to_s] = count
	return count
end
def removeLeadingZeroes(num)
	return num[0] == "0" ? 0 : num
end
primes = Array.new(5000000){true}
primed = Hash.new{false}
tried = Hash.new{-1}
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
	primed[p] = true
end
puts "proceeding to calculation..."
count = 1
i = 0
for p in primes
	(puts p or count += 1) if i % (3 ** count) == 0
	(puts p or break) if primeable?(p, primed, tried)
	i += 1
end
