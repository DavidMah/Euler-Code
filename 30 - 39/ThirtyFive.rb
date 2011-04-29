def circular(n)
	n = n.to_s.split("").map{|x| Integer(x)}
	for i in 1..n.size
		b = n.clone
		while b[0] == 0
			b.delete_at(0)
		end
		return false if $primes[Integer(b.join)] == nil
		temp = n.shift
		n << temp
	end
	true
end
$primes = Array.new(1000000){true}
for i in 2..1000000
	puts i.to_s + "..." if i % 50000 == 0
	j = i * 2
	while j < 1000000
		$primes[j] = nil
		j += i
	end
end
quantity = 0
for i in 2..1000000
	puts i.to_s + "....." if i % 50000 == 0
	quantity += 1 if $primes[i] != nil and circular(i)
end
puts quantity
