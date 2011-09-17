def checkLychrel(n)
	for i in 1...50
		n = n + getReverse(n)
		return false if isPalindrome(n)
	end
	return true
end
def getReverse(n)
	return Integer(dropZeroes(n.to_s.split("").reverse).join)
end
def dropZeroes(s)
	while s[0] == "0"
		s = s[1..s.size]
	end
	return s
end
def isPalindrome(n)
	return n == getReverse(n)
end
total = 0
for i in 1...10000
	total += 1 and puts i if checkLychrel(i)
end
puts total
