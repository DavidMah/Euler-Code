def penta(n)
	n * (3 * n - 1) / 2
end
def checks(a, b)
	a = $forward[a] 
	b = $forward[b]

	return false if $list[a + b] == nil
	return false if $list[a - b] == nil
	puts a.to_s + " " + b.to_s + ">>" + (a - b).to_s
	true
end
$forward = Hash.new
$list = Hash.new
for i in 1..100000
	puts i if i % 1000 == 0
	b = penta(i)
	$list[b] = i
	$forward[i] = b
end
for i in 1..10000
	puts i if i % 100 == 0
	for j in 1..10000
		checks(i, j)
	end
end
