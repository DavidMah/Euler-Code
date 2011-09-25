# Four.rb
#
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# Find the largest palindrome made from the product of two 3-digit numbers.

# Process:
# Multiply all 3 digit numbers by 3 digit numbers for values n
# if n is a palindrome, see if it is largest than the current largest
#
# O(n^2) where n is the bound of numbers to multiply by each other(999)

def is_palindrome(input)
  input.to_s == input.to_s.split("").reverse.join("")
end

largest = 1
(100..999).each do |i|
  (100..999).each do |j|
		value = i*j
		largest = value if value > largest and is_palindrome(value)
	end
end

puts largest
