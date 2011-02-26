def recurrings(n)
	value = 1.0 / n
	i = 1
	decimal_set = []
	while i < 99 
		decimal_set << Integer(value * (10 ** i) % 10)
		i += 1
	end
	puts "\n" + decimal_set.join
	-1
end
best = 1
for i in 1..1000
	best = i if recurrings(i) > best
end
