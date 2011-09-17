def factors(n)
	i = 2
	count = 0
	p = 2
	while p < n 
		p = $primes[i]
		count += 1 if n / p * p == n
		return false if count > 4	
		i += 1
	end
	return false if count < 4
	true
end
$primes = Array.new(400000){true}
for i in 2..400000
	next if $primes[i] == nil
	puts i.to_s + ".."# if i % 400000 == 0
	$primes[i] = i
	j = i * 2
	while j < 400000
		$primes[j] = nil
		j += i
	end
end
$primes.reject!{|x| x == nil}
count = 0
for i in 1..160000
	puts i.to_s + "..." if i % 10000 == 0
	factors(i) ? count += 1 : count = 0 
	puts i - 3 and break if count == 4
end
