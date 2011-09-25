# Seven.rb
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10 001st prime number?
#
# Process:
#
# Run a sieve of eratosthenes up to INITIAL_CAP and try to access the target prime
# if the sieve isn't large enough, then increase the size of cap and try again
#
# O(n*log(n)*log(n) * m) for how many times initial cap needs to be raised

TARGET_PRIME = 10001
INITIAL_CAP  = 120000
def find_prime(target_prime, cap)
	values = Array.new(cap){false}
	(2...values.size).each do |v|
		values[v] = nil or next if v < 2
		next if values[v].nil?
		values[v] = v

		j = v * 2
		while j < values.size
			values[j] = nil
			j += v
		end
	end
	return false if values.size <= target_prime + 1
	values.compact[target_prime + 1]
end
cap = INITIAL_CAP
until result = find_prime(TARGET_PRIME, cap)
	cap *= 9
end
puts result
