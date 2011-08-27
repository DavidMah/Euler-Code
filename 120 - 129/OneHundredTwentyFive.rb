def summableBySquares(n)
	min = 1
	max = 1
	current = max
	while max < n
		max += 1
		current += max ** 2
		while current > n
			current -= min ** 2
			min += 1
		end
		if current == n
			return true
		end
	end
	return false
end
def generatePalindromes(cap, memoizer = Hash.new{false}, input = '')
	puts input
	numVersion = ((input != '' and input[0] != '0') ? Integer(input) : 0)
	puts numVersion
	return 0 if numVersion > cap
	sum = 0
	if not memoizer[numVersion]
		sum += numVersion if summableBySquares(numVersion)
		memoizer[numVersion] = true
	end
	for i in 1..9
		nextInput = i.to_s + input + i.to_s
		sum += generatePalindromes(cap, memoizer, nextInput)
	end

	return sum
end
generatePalindromes(10**8)
