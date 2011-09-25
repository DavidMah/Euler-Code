# One.rb
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

# Process:
# Add all 3s + All 5s - All 15s
#
# O(1)

TARGET = 1000
PIECE_ONE = 3
PIECE_TWO = 5

# Adding 3 + 6 + 9 + 12.. 999 is the same as adding 1002
# as many times as half of the elements in 3..6...999
def get_sum_through(target, piece)
  target -= 1
  highest_multiple = target / piece * piece
  sum_chunk        = highest_multiple + piece
  quantity         = target / piece / 2
  odd              = target / piece % 2
  odd_piece        = odd * sum_chunk / 2

  sum_chunk * quantity + odd_piece
end

sum = 0
sum += get_sum_through(TARGET, PIECE_ONE)
sum += get_sum_through(TARGET, PIECE_TWO)
sum -= get_sum_through(TARGET, PIECE_ONE * PIECE_TWO)
puts sum
