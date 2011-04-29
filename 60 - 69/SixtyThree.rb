count = 0
for i in 1..4000
	puts i.to_s + ".." if i % 1000 == 0
	for j in 1..45
		result = i ** j
		count += 1 if Math.log10(result).to_int + 1 == j
	end
end
puts count
