def divis(n)
	for i in 1..20
		a = n % i == 0
		return false if not a
	end
	true
end
problem = false
result = -1
current = 45000000 
while not problem
	result = current and problem = true if divis(current)
	current = current + 20
end
