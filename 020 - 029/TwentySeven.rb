def magic(a, b)
	survival = true
	n = 0
	while survival
		survival = $primes[n * n + a * n + b]	
		n += 1
	end
	puts a.to_s + " " + b.to_s + " >> " + n.to_s if n > 2
	n
end
$primes = Array.new(1000000) 
for i in 2..100000
	$primes[i] = true
end
for i in 2..100000
	if $primes[i] == true
		puts i
		counter = 2
		while i * counter < 100000
			$primes[i * counter] = false
			counter += 1
		end
	end
end
best = 0
best_pair = [-1001, -1001]
for a in -1000..999
	puts a if a % 100 == 0
	for b in -1000..999
		new = magic(a, b)
		best_pair = [a, b] and best = new if new > best
	end
end
puts best_pair.to_s + " >>>> " + (best_pair[0] * best_pair[1]).to_s
