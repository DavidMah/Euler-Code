a = 0
i = 1
sum = 0
while i < 4000000
	temp = i
	i = i + a
	a = temp
	sum += i if i.even?
end
puts sum
