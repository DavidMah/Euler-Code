#Finding the most efficient exponentiation method.
#We shall define m(k) to be the minimum number of multiplications to compute nk; for example m(15) = 5.
#For 1  k  200, find E m(k).

$best = -1
def findFastest(i)
	$best = -1
	findFastestHelper(i)
end
def findFastestHelper(n, available = Array.new(1){1}, depth = 0)
	return -1 if depth > $best and $best != -1
	return -1 if available[0] > n
	if(available[0] == n)
		$best = depth
	end
	best = -1
	for i in available
		for j in available
			available.insert(0, i + j)
			result = findFastestHelper(n, available, depth + 1)
			available.delete_at(0)
			best = result if (best == -1) or (result < best and result != -1)
		end
	end
	return best
end
sum = 0
for i in 1..200
	findFastest(i)
	sum += $best
	puts i.to_s + "=>" + $best.to_s
end
puts $best

