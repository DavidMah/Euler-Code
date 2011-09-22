# Three.rb
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the TARGET 600851475143 ?
#
# Process:
#
# Find all factors by working up from 2
# Check if n is a factor, if so, divide away n from target
# Consider both n and target / n to be factors
# Do this until n is equal to target(which has also been shrinking while n increaess)
# O(n) -- Worst case, TARGET is prime
#
# Then find out which of the factors are prime
#   Find this through O(n) operation that tries all integers < n
# And choose the largest of them
# O(n^2)
#
# O(n^2)

TARGET = 600851475143
def is_prime(n)
	(2..(n / 2 + 1)).each do |i|
		return false if n / i * i == n
	end
	true
end

def find_factors(target)
	list = []
	i    = 2
	while i < target
		if target / i * i == target
			list  << i
			target = target / i
			list  << target
			i     -= 1
		end
		i += 1
	end
	list
end

list = find_factors(TARGET).reverse!

results = []
list.select! {|num| is_prime(num)}
puts list.sort.last
