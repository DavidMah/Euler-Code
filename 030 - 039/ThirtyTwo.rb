def isPandigital(n)
	result = Array.new(10){0}
	for i in 0..9
		result[(n/(10 ** i)) % 10] += 1
	end
	for i in 0..9
		return false if result[i] != 1
	end
	return true
end
def tryMult(n)
	for i in 2..(Math.log10(n) + 1).to_i
		prod = n / (10 ** i)
		fact = n % (10 ** i)
		success = false
		for j in 1..(Math.log10(fact) + 1).to_i
			left = fact / (10 ** j)
			right = fact % (10 ** j)
			success = true if left * right == prod
		end
		$results[prod] = prod if success
		puts prod if success
	end
end
def	tryPandigital(num, chosen, progress)
	tryMult(num) if chosen == 9
	return num if chosen == 9
	for i in 0..8
		next if progress[i] == 1
		progress[i] = 1
		num += (i + 1) * (10 ** chosen)
		tryPandigital(num, chosen + 1, progress)
		num -= (i + 1) * (10 ** chosen)
		progress[i] = 0
	end
end
$results = Hash.new
tryPandigital(0, 0, [0, 0, 0, 0, 0, 0, 0, 0, 0])
$results = $results.to_a.map{|x| x[0]}
puts $results.to_a
puts $results.inject{|x, y| x + y}
