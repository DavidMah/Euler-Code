def remarkable(primetable, a, b)
	a = a.to_s
	b = b.to_s
	return false if primetable[Integer(a + b)] == false
	return false if primetable[Integer(b + a)] == false
	return true
end
primes = Array.new(100000){0}
primetable = Hash.new{false}
for i in 2...primes.size
	next if primes[i] == nil
	puts i
	primes[i] = i
	primetable[i] = []
	j = i * 2
	while j < primes.size
		primes[j] = nil
		j += i
	end
end
primes[0] = nil
primes[1] = nil
primes.compact!

for i in 0...primes.size
	puts primes[i]
	for j in (i + 1)...primes.size
		if remarkable(primetable, primes[i], primes[j])
			primetable[primes[i]] << primes[j]
			primetable[primes[j]] << primes[i]
		end
	end
end
primetable.reject!{|key, value| value.size < 4}
primetable = primetable.to_a.map{|kv| [kv[0], kv[1].reject!{|p| primetable[p] == false}]}
for p in primetable
	puts p.to_s
end
