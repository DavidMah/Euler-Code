def triangle(n)
	(0.5 * n * (n + 1)).to_i
end
def value(text)
	return 0 if text == '"'
	return text.ord - "A".ord + 1 if text.length == 1
	return text.split("").map{|l| value(l)}.inject{|x, y| x + y}
end
triangles = Hash.new{false}
for i in 1..10000
	triangles[triangle(i)] = true
end

input = File.new("FourtyTwo.txt", "r")
text = input.gets.chomp.split('","')

total = 0
for t in text
	total += 1 if triangles[value(t)]
end
puts total
