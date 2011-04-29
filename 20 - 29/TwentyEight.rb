sum = 1
for b in 1..500
	n = b * 2 + 1
	for k in 0..3
		sum += n*n - k*(n - 1)
	end
end
puts sum
