# Six.rb
#
# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
#
# Process:
#	Loop through the range and just calculate the answer exactly as the problem asked
# O(n) ignoring time for the multiplication because multiplication time will stay trivial until really really really large numbers
#
RANGE = 1..100
sumSquare = 0
squareSum = 0
(RANGE).each do |i|
	sumSquare += i * i
	squareSum += i
end 
squareSum = squareSum * squareSum 
puts squareSum - sumSquare
