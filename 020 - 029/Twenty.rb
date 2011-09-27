# Twenty.rb
# n! means n  (n  1)  ...  3  2  1
#
# For example, 10! = 10  9  ...  3  2  1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!
#
# Process:
# Find factorial(100) O(n)
# Add all the digits O(n)
#
# O(n)
#
BOUND = 100
factorial_result = (1..BOUND).inject{|x, y| x * y}
puts factorial_result.to_s.split("").map{|n| n.to_i}.inject{|x, y| x + y}
