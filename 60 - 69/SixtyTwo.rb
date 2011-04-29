def permute(ndigits)
	ndigits = ndigits.map{|num| [Integer(fixLeadZero(num[0].to_s.split("").sort.join)), num[1]]}.sort{|x, y| x[0] <=> y[0]}
	return ndigits
end
def fixLeadZero(n)
	while n[0] == "0"
		n = n[1...n.length]
	end
	return n
end
def crawl(nums, goal)
	count = 1
	recent = -1
	bucket = []
	for n in nums
		count += 1 if recent == n[0]
		count = 1 and bucket = [] if recent != n[0]
		recent = n[0]
		bucket << n[1]
		return bucket if count == goal
	end
	return -1
end
cubes = Array.new(Math.log10(10000**3).to_i){Array.new}
for i in 1..9999
	c = i ** 3
	cubes[Math.log10(c).to_i] << [c, c]
end
result = -1
for i in 0...cubes.size
	puts i
	cubes[i] = permute(cubes[i])	
	result = crawl(cubes[i], 5)
	break if (result != -1)
end
puts result.sort.to_s
