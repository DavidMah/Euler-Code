#Problem 114: Investigating the number of ways to fill a row with separated blocks that are at least three units long.
#How many ways can a row measuring fifty units in length be filled?
MINIMUM_BLOCK = 3
SPACE_BETWEEN_BLOCK = 1
#Returns the amount of ways one can fill rows boxes with separated blocks of at least MINIMUM_BLOCK size
#starting from index start
def countFills(rows, start = 0, memoizer = Hash.new{false})
	return memoizer[start] if memoizer[start]
	return 1 if start >= rows

	total = 0
	total += countFills(rows, start + SPACE_BETWEEN_BLOCK, memoizer)
	for i in MINIMUM_BLOCK..(rows - start)
		total += countFills(rows, start + i + SPACE_BETWEEN_BLOCK, memoizer)
	end
	memoizer[start] = total
	return total
end
puts countFills(50)
