def d(n)
	sum = 0
	for i in 1..(n / 2 + 1)
		sum += i if n / i * i == n
	end
	sum
end
def amicable(a, b)
	if $results[a] == b and $results[b] == a
		$qualified[a] = true
		$qualified[b] = true
		puts a.to_s + " " + b.to_s
		return 0 if a == b
		return a + b
	end
	0
end
$results = Hash.new
$qualified = Hash.new
for i in 1..9999
	puts i if i % 1000 == 0
	$results[i] = d(i)
end
sum = 0
for i in 1..9999
	puts i if i % 1000 == 0
	for j in 1..9999
		adder = 0
		adder = amicable(i, j) if $qualified[i] == nil
		sum += adder
		puts ">>" + adder.to_s if adder != 0
	end
end
puts sum
