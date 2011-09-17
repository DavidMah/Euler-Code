#Problem 39
#If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.
#{20,48,52}, {24,45,51}, {30,40,50}
#For which value of p  1000, is the number of solutions maximised?

def countSolutions(n)
list = []
	for i in 1..n
		for j in 1..(n - i)
			k = Math.sqrt(i ** 2 + j ** 2)
			list << [i, j, k.to_int] if i + j + k == n * 1.0
		end
	end
	list = list.map{|a| a.sort!}.uniq
	list.size
end
best = [0, 0]
for i in 1..1000
	puts i.to_s + "..." if i % 100 == 0
	a = countSolutions(i)
	best = [i, a] if a > best[1]
end
puts best.to_s
