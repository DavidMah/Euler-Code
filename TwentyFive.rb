a = 0
b = 1
current = 1
while b < (10 ** 999)
	temp = b
	b = a + b
	a = temp

	current += 1
end
puts current 
