# Nine.rb
#
# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
#
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#
# Process:
# Giant Brute Force
# Try all combinations of a, b, c that add to 1000
# O(n^3)

result = -1
(1..998).each do |a|
  (1..(1000 - a)).each do |b|
    c = 1000 - a - b
    result = a * b * c if a**2 + b**2 == c**2
  end
end
puts result
