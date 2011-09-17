def printBoard
	for row in $list
		for num in row
			print " " + num.to_s 
		end
		print "\n"
	end
end
def find(i, j)
	return $list[i][j] if $list[i][j] != 0
	$list[i + 1][j] = find(i + 1, j)
	$list[i][j + 1] = find(i, j + 1)
	$list[i + 1][j] + $list[i][j + 1]
end
$list = Array.new(21){Array.new(21){0}}
for i in 0..20
	$list[20][i] = 1
	$list[i][20] = 1
end
a = 0
b = 0
$list[a][0] = find(0, 0)
printBoard
puts $list[a][b]
