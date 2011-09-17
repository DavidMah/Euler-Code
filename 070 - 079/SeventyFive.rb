CAP = 1500000
squares = Hash.new{false}
roots = Hash.new{false}
i = 1
sq = 1
while i <= CAP
	puts i if i % 100000 == 0
	squares[sq] = i
	roots[i] = sq
	i += 1
	sq = i ** 2
end

sides = squares.to_a.map{|s| s[0]}
triples = Hash.new{false}
for h in sides
	puts squares[h]
	for a in sides
		break if a == h
		b = h - a
		next if not squares[b]

		trip = [a, b, h].sort
		if not triples[trip]
			triples[trip] = trip.map{|sq| squares[sq]}.inject{|x, y| x + y}
			break if triples[trip] > CAP
		end
	end
end

triples = triples.to_a.map{|t| t[0].map{|sq| squares[sq]}}
puts triples.to_s

wires = Hash.new{0}

for trip in triples
	length = trip
	wires[length] = wires[length] + 1
end

wires.reject{|l| l != 1}
puts wires.size
