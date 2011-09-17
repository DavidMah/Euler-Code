def work(p, primes, table)
	result = []
	stringp = p.to_s
	for pri in primes
		next if p == pri
		stringpri = pri.to_s
		result << pri if (table[Integer(stringp + stringpri)] and table[Integer(stringpri + stringp)])
	end
	return result
end
def wipe(index, table) 
	index[1].reject!{|x| not table[x]}
end
def clean(table)
	table.reject!{|p, pri| pri.size < (ARGV.size == 2 ? Integer(ARGV[1]) : 3)}
	return table
end
CAP = ARGV.size == 0 ? 1000000 : Integer(ARGV[0])
primes = Array.new(CAP){false}
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

puts "primes calculated"

table = Hash.new{false}
for p in primes
	table[p] = true
end
for p in primes
	table[p] = work(p, primes, table)
end
puts "primes worked"
winners = clean(table)
puts winners.to_s 
puts ""
for i in 1..15
	for w in winners
		wipe(w, winners)
	end
	clean(winners)
end
puts "primes cleaned"
for w in winners
	puts w.to_s
end
