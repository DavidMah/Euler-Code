ROW_ONE = 0
ROW_TWO = 1
ROW_THREE = 2
ROW_FOUR = 3
COL_ONE = 5
COL_TWO = 6
COL_THREE = 7
COL_FOUR = 8
DIAG = 9
BACK_DIAG = 10
def search(board = Array.new(4){Array.new(4){nil}}, current = 0, requirements = Array.new(10))
	return 1 if board[3][3] != nil
	row = current / 4
	col = current % 4
	valid = findValid(row, column)
	total = 0
	for v in valid
		board[row][col] = v
		total += search(board, current + 1)
		board[row][col] = nil
	end
	return total
end
def findValid(row, column)
	
end
