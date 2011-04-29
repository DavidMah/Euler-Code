def analyze(table, result, i, j, current = 0)
	return if i < 0 or i >= table.size or j < 0 or j >= table.size
	current = current + table[i][j]
	return if result[i][j] <= current and result[i][j] != -1
	puts i.to_s + " - " + j.to_s
	if result[i][j] > current or result[i][j] == -1
		result[i][j] = current
		analyze(table, result, i, j + 1, current)
		analyze(table, result, i + 1, j, current)
		analyze(table, result, i - 1, j, current)
	end

end
input = File.new("EightyTwo.txt", "r")
table = []
while f = input.gets
	table << f.chomp.split(',').map{|x| Integer(x)}
end
result = Array.new(table.size){ Array.new(table[0].size){-1}}
for i in 0...result.size
	puts i.to_s
	analyze(table, result, i, 0)
end
min = result[0][result.size - 1]
for i in 0...result.size
	puts result[i][result.size - 1].to_s + " - " + table[i][table.size - 1].to_s
	min = result[i][result.size - 1] if min > result[i][result.size - 1]
end
puts min

#for i in 0...table.size
#	puts table[i].to_s
#end
#puts ""
#for i in 0...result.size
#	puts result[i].to_s
#end
