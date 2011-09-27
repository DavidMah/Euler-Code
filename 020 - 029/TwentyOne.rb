# TwentyOne.rb
#
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a =/= b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.
#
# Process:
# Keep all integers that are amicable
#   Find amicability of int n by finding sum of divisors of n
#   then find sum of divisors of that result
#     Find sum of divisors with O(n) operation modularity tests
# Add them together
#
# O(n^2)

BOUND = 10000
def is_amicable?(n)
  n_sum_divisors = sum_divisors(n)
  n != n_sum_divisors and n == sum_divisors(n_sum_divisors)
end

def sum_divisors(n)
  divisor_sum = 0
  (1...n).each do |t|
    divisor_sum += t if n % t == 0
  end
  divisor_sum
end
puts (1...BOUND).to_a.select{|x| is_amicable?(x)}.inject{|x, y| x + y}
