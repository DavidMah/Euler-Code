sum = 0
for i in 1...1000
	puts i if i % 1000000 == 0
	sum += i if i % 3 == 0 or i % 5 == 0
end
puts sum
