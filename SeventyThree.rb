list = []
for d in 1..12000
	puts d.to_s + "..." if d % 500 == 0
	for n in 1..(d-1)
		list << n * 1.0 / d * 1.0
	end
end
a = [1, 3]
b = [1, 2]

c = 1.0 / 3.0
d = 1.0 / 2.0
list = list.uniq.sort{|x, y| x <=> y}
ci = list.find_index(c)
dj = list.find_index(d)
puts ci - dj - 1
