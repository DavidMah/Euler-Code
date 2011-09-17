def digitPowerSum(n)
	n.to_s.split("").map{|x| Integer(x)}.map{|x| x ** 5}.inject{|x, y| x + y}
end
list = []
for i in 10..1000000
	list << i if digitPowerSum(i) == i
	puts i if i % 100000 == 0
end
puts list.inject{|x, y| x + y}
