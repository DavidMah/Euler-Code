def fits(i, j)
	num = i * 1.0 / j
	bot = 1.0 / 3
	top = 1.0 / 2
	return (num > bot and num < top)
end
list = []
for i in 1..12000
	puts i
	for j in 1..i
		list << [j, i] if fits(j, i)
	end
end
puts list.map{|x| x[0] * 1.0 / x[1]}.uniq.size
