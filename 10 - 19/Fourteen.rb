$results = Hash.new
def sequence(n)
	if n == 1
		return 1
	elsif $results[n] != nil
		return $results[n]
	elsif n % 2 == 0
		res = 1 + sequence(n / 2)
		$results[n] = res
	else
		res = 1 + sequence(3 * n + 1)
		$results[n] = res
	end
end
greatest = 0
best = 0
for i in 1..999999
	res = sequence(i)
	$results[i] = res
	best = i and greatest = res if res > greatest 
	puts i if i % 10000 == 0
end
puts best
