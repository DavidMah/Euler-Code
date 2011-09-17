def check(n)
	return true if n == 0
	return false if $primes[n] == nil
	leftToRight(n / 10) and rightToLeft(n % (10 **(n.to_s.length)))
end
def leftToRight(n)
	return true if n == 0
	return false if $primes[n] == nil
	leftToRight(n / 10)
end
def rightToLeft(n)
	return true if n == 0
	return false if $primes[n] == nil
	rightToLeft(n % (10 ** (n.to_s.length - 1)))
end
$primes = Array.new(1000000){true}
$primes[1] = nil
for i in 2..10000000
	puts i if i % 1000000 == 0
	next if $primes[i] == nil
	j = i * 2
	while j < 10000000
		$primes[j] = nil
		j += i
	end
end
list = []
for i in 10..10000000
	list << i if check(i)
end
puts list.to_s
puts list.inject{|x, y| x + y}
