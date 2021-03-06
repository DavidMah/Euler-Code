def generate(nums, triangles, squares, pentagons, hexagons, heptagons, octagons, chosen = 0)
	if chosen == 6
		set = create(nums)
		puts set.to_s
		answer = check(set, triangles, squares, pentagons, hexagons, heptagons, octagons)
		puts set if answer
		return answer
	else
		for i in 10..99
			answer = generate(nums + [i], triangles, squares, pentagons, hexagons, heptagons, octagons, chosen + 1)
			return if answer
		end
	end
end
def create(list)
	result = [0] * list.size
	first = list[0]
	for i in 0...(list.size - 1)
		result[i] = list[i] * 100 + list[i + 1]
	end
	result[list.size - 1] = list[list.size - 1] * 100 + first
	return result
end
def check(set, triangles, squares, pentagons, hexagons, heptagons, octagons)
	tests = [0, 0, 0, 0, 0, 0]
	for num in set
		tests[0] += 1 and next if triangles[num]
		tests[1] += 1 and next if squares[num]
		tests[2] += 1 and next if pentagons[num]
		tests[3] += 1 and next if hexagons[num]
		tests[4] += 1 and next if heptagons[num]
		tests[5] += 1 and next if octagons[num]
	end
	return tests == [1, 1, 1, 1, 1, 1]
end
def triangle(n)
	n * (n + 1) / 2
end
def square(n)
	n ** 2
end
def pentagon(n)
	n * (3 * n - 1) / 2
end
def hexagon(n)
	n * (2 * n - 1)
end
def heptagon(n)
	n * (5 * n - 3) / 2
end
def octagon(n)
	n * (3 * n - 2)
end
triangles = Hash.new{false}
squares = Hash.new{false}
pentagons = Hash.new{false}
hexagons = Hash.new{false}
heptagons = Hash.new{false}
octagons = Hash.new{false}
for i in 1..10000
	triangles[triangle(i)] = true
	squares[square(i)] = true
	pentagons[pentagon(i)] = true
	hexagons[hexagon(i)] = true
	heptagons[heptagon(i)] = true
	octagons[octagon(i)] = true
end
generate([], triangles, squares, pentagons, hexagons, heptagons, octagons)
