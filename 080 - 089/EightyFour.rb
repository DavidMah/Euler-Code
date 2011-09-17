def chance(spot)
	result = $possibilities.shift
	$possibilities.push(result)
	result = Math.log10(spot + 5).to_i * 10 + 5 if result == -2
	result = (spot > 12 and spot < 27) ? 27 : 12 if result == -3
	result = spot - 3 if result == -4
	result = spot if result == -1
	return result
end
def roll()
	one = rand(6).to_i + 1
	two = rand(6).to_i + 1
	$rolls = (one == two) ? $rolls + 1 : 0
	total = one + two
	return total
end
def move(start, board)
	total = roll()
	ending = (start + total) % 40
	if $rolls == 3 
		$rolls = 0
		ending = 10
	elsif board[ending][0][0..1] == "CC"
		chance = rand(16).to_i
		ending = 0 if chance == 0
		ending = 10 if chance == 1
	elsif board[ending][0][0..1] == "CH"
		ending = chance(ending)
	elsif board[ending][0] == "G2J"
		ending = 10
	end
	return ending % 40
end
$rolls = 0
board = ['GO', 'A1', 'CC1', 'A2', 'T1', 'R1', 'B1', 'CH1', 'B2', 'B3', 'JAIL',
		'C1',' U1', 'C2', 'C3', 'R2', 'D1', 'CC2', 'D2', 'D3', 'FP',
		'E1', 'CH2', 'E2', 'E3', 'R3', 'F1', 'F2', 'U2', 'F3', 'G2J',
		'G1', 'G2', 'CC3', 'G3', 'R4', 'CH3', 'H1', 'T2', 'H2']
board = board.map{|s| [s, 0]}
total = 0
for i in 1..10000
	puts i
	$possibilities = [0, 10, 11, 24, 39, 5, -2, -2, -3, -4, -1, -1, -1, -1, -1, -1].sort{|x, y| rand(16) <=> rand(16)}
	location = 0
	for j in 1..1000
		target = move(location, board)
		board[target][1] += 1
		total += 1
		location = target
	end
	$rolls = 0
end
board = board.map{|s| [s[0], s[1] * 1.0 / total]}
puts board.to_s + "\n\n"
for i in 0...board.size
	board[i] << i
end
puts board.sort{|x, y| x[1] <=> y[1]}.reverse[0..2].to_s
