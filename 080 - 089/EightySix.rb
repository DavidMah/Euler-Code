#simulate, continue, and analyze are SLOW.  Like hella slow. Creates a cube and then tests it.
#Better version generate creates triangles and finds cubes out of it.  Fewer possible triangles in the universe than possible cubes.
def simulate(m, squares, done)
	count = 0
	for a in 1..m
		for b in 1..m
			for c in 1..m
				result = analyze(a, b, c, squares, done)
				count += 1 if result
			end
		end
	end
	return count
end
def continue(m, squares, done)
	count = 0
	a = m 
	for b in 1..m
		for c in 1..m
			result = analyze(a, b, c, squares, done)
			count += 1 if result
		end
	end
	return count
end
def analyze(a, b, c, squares, done)
	mix = [a, b, c].sort
	return false if done[mix]
	done[mix] = true
	first = c ** 2 + (a + b) ** 2
	second = a ** 2 + (b + c) ** 2
	third = b ** 2 + (a + c) ** 2
	shortest = [first, second, third].min
	return squares[shortest]
end
def generate(triple, squares, roots, done, cap, blocked)
	puts triple.to_s
	count = 0
	for u in 1...triple[1]
		v = triple[1] - u
		x = triple[0]
		first = roots[triple[2]]
		second = roots[u] + roots[v + x]
		third = roots[v] + roots[u + x]

		best = [first, second, third].min

		overload = [u, v, x].max
		if best == first and not done[[x, v, u].sort]
			count += 1
			count -= 1 and blocked[overload] = blocked[overload] + 1 if overload > cap
			done[[x, v, u].sort] = true
		end
	end
	puts "\t" + count.to_s
	return count
end

squares = Hash.new{false}
roots = Hash.new{false}
done = Hash.new{false}
for i in 1..10000
	squares[i**2] = i
end
for i in 1..100000
	roots[i] = i ** 2
end

#count = 0
#m = 0
#while count < 1000000
#	m += 1
#	puts m
#	puts count
#	count += continue(m, squares, done)
#end
#puts count
#puts m
squareList = squares.to_a.map{|s| s[0]}
triangles = Hash.new
blocked = Hash.new{0}
for c in squareList
	puts c.to_s
	for a in squareList
		break if a == c
		b = c - a
		triple = [a, b, c]
		triangles[triple] = triple if squares[b]
	end
end
triangles = triangles.to_a.map{|t| t[0].map{|n| squares[n]}}
count = 0
m = 1
for t in triangles
	count += generate(t, squares, roots, done, m, blocked)
end

while count < 1000000
	m += 1
	count += blocked[m]
	puts count
end
puts count.to_s
puts m.to_s
