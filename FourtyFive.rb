def triangle(n)
	n * (n + 1) / 2
end
def pentagon(n)
	n * (3*n - 1) / 2
end
def hexagon(n)
	n * (2*n - 1)
end
$triangles = Hash.new
$pentagonals = Hash.new
$hexagonals = Hash.new
for i in 1..60000
	a = triangle(i)
	b = pentagon(i)
	c = hexagon(i)
	$triangles[i] = a#This is different from the other two!
	$pentagonals[b] = i
	$hexagonals[c] = i
end

for i in 285..60000
	result = $triangles[i]
	puts result if $pentagonals[result] != nil and $hexagonals[result] != nil
end
