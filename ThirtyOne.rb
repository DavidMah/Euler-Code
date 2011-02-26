def bust(n, increment)
	puts n.to_s + " " + increment.to_s
	if n == 0
		puts "0 child"
		0
	elsif increment == 1
		puts "add child"
		1
	elsif n == increment
		puts "add children"
		1 + bust(n, $reduction[increment])
	elsif n > increment
		bust(increment, increment) + bust(n - increment, increment)
	else n < increment 
		bust(n, $reduction[increment])
	end
end
total = 200
$count = 1#Account for case of single Twohundred
$reduction = Hash.new
$reduction[200] = 100
$reduction[100] = 50
$reduction[50] = 20
$reduction[20] = 10
$reduction[10] = 5
$reduction[5] = 2
$reduction[2] = 1


$two = Hash.new
$five = Hash.new
$ten = Hash.new
$twenty = Hash.new
$fifty = Hash.new
$hundred = Hash.new
puts "-------------"
puts bust(3, 2)
