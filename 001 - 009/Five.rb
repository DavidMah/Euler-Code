# Five.rb
#
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
#
# Process:
# 
# Find the least common multiple of the first two values
# Find the least common multiple of the result with the next value
# Continue till the end
#
# Least common multiple found using greatest_common_divisor and the Euclidean Algorithm O(d) (digits)
#
# O(n^2) -- n is the upper bound of range, and Digit Count in a GCD will be lower than n as n approaches infinity

def least_common_multiple(m, n)
  (m * n).abs / greatest_common_divisor(m, n)
end

def greatest_common_divisor(m, n)
  return n if m == 0
  return m if n == 0
  greatest_common_divisor(n, m - n * (m / n))

end
RANGE     = 1..20
result = RANGE.inject{|current_lowest, value| least_common_multiple(current_lowest, value)}
puts result
