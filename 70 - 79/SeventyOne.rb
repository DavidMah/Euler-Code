fractions = Hash.new{false}

value = [3, 7, 3.0 / 7.0]
best = [0, 0, 0]
bestDifference = value[2] - best[2]
fractions[value[2]] = true
for i in 10..1000000
	puts i
	j = i * 3 / 7
	fraction = [j, i, j * 1.0 / i]
	difference = value[2] - fraction[2]
	next if fractions[fraction[2]] != false
	fractions[fraction[2]] = true
	bestDifference = difference and best = fraction if difference < bestDifference
end
puts best.to_s
