def isPandigital(n)
	result = Array.new(9){0}
	for i in 0..(Math.log10(n)).to_i
		result[i] += 1
	end
	for i in result
		return false if i != 1
	end
	return true
end
def generatePandigitals(num, chosen, possibles)
	result = 0
	result = check(num) if chosen == 9
	$best = $best > result ? $best : result
	return "Back" if chosen == 9
	for i in 0..8
		next if possibles[i] == 1
		possibles[i] = 1
		num += (i + 1) * (10 ** chosen)
		generatePandigitals(num, chosen + 1, possibles)
		num -= (i + 1) * (10 ** chosen)
		possibles[i] = 0
	end
end
def check(n)
	for i in 1..(Math.log10(n).to_i)
		front = n / (10 ** i)
		back = n % (10 ** i)
		finish = false
		multiplier = 2
		until finish
			step = front * multiplier
			steplength = (Math.log10(step) + 1).to_i
			backlength = back != 0 ? (Math.log10(back) + 1).to_i : 0
			piece = back / (10 ** (backlength - steplength))

			break if step != piece
			back = back % (10 ** (backlength - steplength))
			return n if back == 0

			multiplier += 1
		end
	end
	return 0
end
$best = 0
generatePandigitals(0, 0, [0, 0, 0, 0, 0, 0, 0, 0, 0])
puts $best
