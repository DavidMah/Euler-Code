# Ten.rb
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
#
# Process:
# Use the Sieve of Eratosthenes with given Bound
# Add up involved primes
#
# O(n*logn*logn)

BOUND = 2000000
possible_primes = Array.new(BOUND){false}
(2...BOUND).each do |i|
  next if possible_primes[i].nil?
  possible_primes[i] = i

  j = i * 2
  while j < BOUND
    possible_primes[j] = nil
    j += i
  end
end
possible_primes[0] = nil; possible_primes[1] = nil
primes = possible_primes.compact

puts primes = primes.inject{|x, y| x + y}
