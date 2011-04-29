def recurrings(n)
	solved = Hash.new{false}
	num = 1
	current = 10
	while true
		return 0 if current % n == 0
		if current / n != 0
			return num - solved[current] if solved[current] != false
			solved[current] = num
			num += 1
			current = current % n
		else
			num += 1
			current *= 10
		end
	end
end
best = 1
for i in 2..1000
	puts i
	best = i if recurrings(i) > best
end
puts best
