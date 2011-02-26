largest = 1
for i in 100..999
	for j in 100..999
		value = i*j
		largest = value if value > largest and (value/1000).to_s == (value%1000).to_s.split("").reverse!.map{|x| Integer(x)}.join
	end
end
puts largest
