sum = 0
for i in 1..1000
	sum += i ** i
end
puts sum % 10000000000
