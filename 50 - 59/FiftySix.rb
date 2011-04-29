def digitalSum(num)
	num.to_s.split("").map{|x| Integer (x)}.inject{|x, y| x + y}
end
max = 0
for a in 1..100
	puts a
	for b in 1..100
		sum = digitalSum(a ** b)
		max = max > sum ? max : sum
	end
end
puts max
