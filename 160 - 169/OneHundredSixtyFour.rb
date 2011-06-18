def calculate(current = '', count = 0, memoizer = Hash.new{false})
	puts current
	key = [current[0], current[1], count]
	return memoizer[key] if memoizer[key]
	if count == 20
		return 0 if current[0] == '0'
		return 1
	end
	total = 0
	for i in 0..9
		first = (current[0] ? Integer(current[0]) : 0)
		second = (current[1] ? Integer(current[1]) : 0)
		break if i + first + second > 9
		total += calculate(i.to_s + current, count + 1, memoizer);
	end
	memoizer[key] = total
	return total
end
puts calculate();
