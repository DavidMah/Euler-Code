def chain(n, table, primes, count = 0)
	return 0 if table[n] != false
	result = magic(n, primes)
	table[n] = result
	$nums += 1
	return 0 if result > 1000000
	return 1 + chain(result, table, primes, count + 1)
end
def magic(original, primes)
	i = 0
	n = original
	divs = [1]
	while primes[i] <= n and primes[i] != original
		while n % primes[i] == 0
			n /= primes[i]
			divs << primes[i]
		end
		i += 1
	end
	divs = (divs + find_divisors(divs)).uniq.sort
	return divs.inject{|x, y| x + y}
end
def find_divisors(primes, spots = ([0] * primes.size), num = 1, chosen = 0, index = 0)
	return [] if chosen == (spots.size - 1)
	divs = [num]
	for i in index...primes.size
		next if spots[i] == 1
		spots[i] = 1
		num *= primes[i]
		divs = divs + find_divisors(primes, spots, num, chosen + 1, i)
		spots[i] = 0
		num /= primes[i]
	end
	return divs
end
primes = Array.new(1000000){false}
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


table = Hash.new{false}
best = 0
longest = 0
$nums = 0
for i in 0..100
	puts i or puts $nums if i % 10000 == 0
	result = chain(i, table, primes)
	longest = result and best = i if result > best
end

start = best
here = table[start]
puts best.to_s + "<<<"
puts here.to_s
puts table.to_s
while here != start
	best = here if here < best
	here = table[here]
end
puts best
