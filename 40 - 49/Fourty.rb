answer = 1
current = 0
num = 0
index = 0
desired = [1, 10, 100, 1000, 10 ** 4, 10 ** 5, 10 ** 6]
while true
	num += 1
	margin = Math.log10(num).to_i + 1
	current += margin
	digit = current - desired[index]
	answer *= (num / (10 ** digit) % 10) and index += 1 and puts (num / (10 ** digit) % 10) if current >= desired[index] and current - margin <= desired[index]
	break if index == desired.size
end
puts answer
