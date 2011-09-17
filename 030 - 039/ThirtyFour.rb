def checka(n)
	n.to_s.split("").map{|x| Integer(x)}.map{|x| $facts[x]}.inject{|x, y| x + y}
end
def factorial(n)
	return 1 if n == 0
	n * factorial(n - 1)
end
list = []
$facts = Hash.new
for i in 0..9
	$facts[i] = factorial(i)
end
for i in 3..10000000
	puts i.to_s + "..." if i % 100000 == 0
	list << i if checka(i) == i
end
puts list.inject{|x, y| x + y}
