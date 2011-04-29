def divsies(num)
	limit = num
	total = 0

	i = 1
	while i < limit
		limit = num / i and total += 1 if num % i == 0
		i += 1
	end
	total * 2
end
	return 2 if divers.empty?
	divers << num
	divers.map!{|x| [1, x]}
	i = 0
	puts divers.to_s
	while i < divers.size - 1
		divers[i] = [divers[i][0] + 1, divers[i][1]] and divers.delete_at(i + 1) and i-= 1 if divers[i][1] == divers[i + 1][1]
		i += 1
	end
	puts divers.to_s
	result = divers.map{|x| x[0] + 1}.inject{|x, y| x + y}
	result
end
#triangle calculation
$triangles = Hash.new
$triangles[1] = 1
i = 1
divs = 1
while divs < 501
	puts i.to_s + " " + divs.to_s if i % 30 == 0
	$triangles[i + 1] = $triangles[i] + i + 1
	i += 1
	divs = divsies($triangles[i])
end
puts $triangles[i]
