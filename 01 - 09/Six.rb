sumSquare = 0
squareSum = 0
for i in 1..100
	sumSquare += i * i
	squareSum += i
end 
squareSum = squareSum * squareSum 
puts sumSquare
puts squareSum
puts squareSum - sumSquare
