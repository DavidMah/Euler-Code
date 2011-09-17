def convert(input, table, chart)
	value = letters_to_nums(input, table, chart)
	result = nums_to_letters(value, table, chart)
	return input.length - result.length
end
def letters_to_nums(input, table, chart, start = 0)
	return 0 if input.length == 0
	return 0 if start >= table.length
	sum = 0
	while input[0] == table[start][0]
		sum += table[start][1]
		input = input[1...input.length]
	end
	while (i = input.index(table[start][0])) != nil
		sum += convert_piece(input[0..i], table, chart, start)
		input = input[(i + 1)...input.length]
	end

	return sum + letters_to_nums(input, table, chart, start + 1)
end
def convert_piece(piece, table, chart, start)
	sum = table[start][1]
	piece = piece[0...(piece.length - 1)]
	while piece.length > 0
		sum -= table[chart[piece[0]]][1]
		piece = piece[1...piece.length]
	end
	return sum
end
def nums_to_letters(input, table, chart, start = 0)
	return "" if input == 0
	result = ""
	while input >= table[start][1]
		result += table[start][0]
		input -= table[start][1]
	end

	takeAway = start + (start % 2 == 0 ? 2 : 1)
	return result if input == 0
	while input >= (table[start][1] - table[takeAway][1])
		result += table[takeAway][0] + table[start][0]
		input -= (table[start][1] - table[takeAway][1])
	end
	return result + nums_to_letters(input, table, chart, start + 1)
end
chart = Hash.new{false}
table = [['M', 1000], ['D', 500], ['C', 100], ['L', 50], ['X', 10], ['V', 5], ['I', 1]]
chart['M'] = 0 and chart['D'] = 1 and chart['C'] = 2
chart['L'] = 3 and chart['X'] = 4 and chart['V'] = 5 and chart['I'] = 6
chart[0] = 'M' and chart[1] = 'D' and chart[2] = 'C' and 
chart[3] = 'L' and chart[4] = 'X' and chart[5] = 'V' and chart[6] = 'I'

input = File.new("EightyNine.txt", "r")

saved = 0
while f = input.gets
	saved += convert(f.chomp, table, chart)
end
puts saved.to_s
