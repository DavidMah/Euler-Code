$words = Hash.new
$words[1] = 3
$words[2] = 3
$words[3] = 5
$words[4] = 4
$words[5] = 4
$words[6] = 3
$words[7] = 5
$words[8] = 5
$words[9] = 4
$words[10] = 3

$words[11] = 6
$words[12] = 6
$words[13] = 8
$words[14] = 8
$words[15] = 7
$words[16] = 7
$words[17] = 9
$words[18] = 8
$words[19] = 8

$words[20] = 6
$words[30] = 6
$words[40] = 5
$words[50] = 5
$words[60] = 5
$words[70] = 7
$words[80] = 6
$words[90] = 6

$words[100] = 7
$words[1000] = 11
def evaluate(n)
	top = high(n / 100 * 100)
	bot = low(n % 100)	
	result = top + bot
	result += 3 if top != 0 and bot != 0
	result
end
def low(n)
	return 0 if n == 0
	return $words[n] if $words[n] != nil
	return low(n % 10) + $words[n / 10 * 10]
end
def high(n)
	return 0 if n == 0
	return $words[1000] if n == 1000
	return low(n / 100) + $words[100]
end
sum = 0
for i in 1..1000
	sum += evaluate(i)
end
puts sum
