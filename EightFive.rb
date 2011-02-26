def find_size(width, height)
	return $size[width, height] if $size[width, height] != nil
	height * find_size(width - 1, height)
end
$size = Hash.new
$dimension = Hash.new
for i in 1..10000
	for j in 1..10000
		find_size(i, j)
	end
end
i = 0
while true
	result = $dimension[i] and break if $dimension[i] != nil
	result = $dimension[-i] and break if $dimension[i] != nil
end
puts result[0] * result[1]
