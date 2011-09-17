def analyze(table, result, i, j)
	return -1 if i >= table.size or j >= table.size
	return result[i][j] if result[i][j] != -1
	down = analyze(table, result, i, j + 1)
	right = analyze(table, result, i + 1, j)
	result[i][j] = table[i][j] and return table[i][j] if down == -1 and right == -1
	result[i][j] = table[i][j] + down and return result[i][j] if right == -1
	result[i][j] = table[i][j] + right and return result[i][j] if down == -1
	result[i][j] = table[i][j] + (down < right ? down : right)
	return result[i][j]
end
input = File.new("EightyOne.txt", "r")
table = []
while line = input.gets
	line = line.chomp.split(",").map{|x| Integer(x)}
	table << line
end
result = Array.new(table.size){Array.new(table.size){-1}}
puts analyze(table, result, 0, 0)
