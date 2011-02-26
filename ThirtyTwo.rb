def isPandigital(a, b, c)
	(a.to_s + b.to_s + c.to_s).split("").map{|x| Integer(x)}.sort == [1, 2, 3, 4, 5, 6, 7, 8, 9]	
end
def len(n)
	i = 0
	while n != 0
		n /= 10
		i += 1
	end
	i
end
list = []
for a in 1..99999
	puts a.to_s + "..." if a % 50 == 0
	for b in 1..(10 ** (9 - len(a)))
		puts ">>" + b.to_s if b % 100000 == 0
		list << a * b if isPandigital(a, b, a  * b)
	end
end
list.sort!
list.uniq!
puts list.inject{|x, y| x + y}
