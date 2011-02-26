sum = 0
i = 1
while i < 1000
	sum += i if (i*1.0/3%1 == 0) or (i*1.0/5%1 == 0)
	i += 1
end
puts sum
