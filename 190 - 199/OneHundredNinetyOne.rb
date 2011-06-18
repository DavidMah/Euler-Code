def findPrizes(target, current = '', absent_count = 0, late_count = 0, memoizer = Hash.new{false})
	key = [current.length, absent_count, late_count]
	return memoizer[key] if memoizer[key]
	return 0 if absent_count == 3
	return 0 if late_count == 2
	return 1 if current.length == target
	total = 0
	total += findPrizes(target, current + 'O', 0, late_count, memoizer)
	total += findPrizes(target, current + 'A', absent_count + 1, late_count, memoizer)
	total += findPrizes(target, current + 'L', 0, late_count + 1, memoizer)
	memoizer[key] = total
	return total
end
puts findPrizes(30)
