def play_games(n, t)
  victories = 0
  games = 0
  n.times do
    victories += 1 if not play_game(t)
    games += 1
  end
  [victories, games]
end

def play_game(t)
  a_score = 0
  b_score = 0
  while a_score < 100 and b_score < 100
    a_score += (rand() > 0.5 ? 1 : 0)
    break if a_score >= 100
    b_score += (rand() < (1.0/2**t) ? (2 ** (t - 1)) : 0)
    # puts [a_score, b_score].to_s
  end
  a_score >= 100
end

def get_one_pmf(cap)
  results = {}
  chance_total = (1.0/2.0) ** 100
  chance_eff   = 1
  (100..cap).each do |t|
    results[t] = (chance_eff * chance_total * choose(t, 100)) / 2.0
    chance_eff *= 1.0/2.0
  end
  results
end

def get_cap_pmf(cap)
  chance_total = (1.0/8.0) ** 25
  chance_eff   = 1
  results      = {}
  (25..cap).each do |t|
    results[t] = (chance_eff * chance_total * choose(t, 25)) / 8.0
    # puts "#{chance_eff} * #{chance_total} * #{choose(t, t-25)}  = #{results[t]}"
    chance_eff *= 7.0 / 8.0
  end
  results
end

def choose(n, k)
  return 1 if k == 0
  fact(n) / (fact(n - k)*fact(k))
end

$memo = {}
def fact(n)
  return $memo[n] if $memo[n]
  return 1 if n == 0
  $memo[n] = n * fact(n - 1)
  $memo[n]
end

CAP = 3200
# Gathring Statistics
# result = play_games(50000, 3)
# puts result[0].to_f / result[1]
#
pmf = get_cap_pmf(CAP)
opmf = get_one_pmf(CAP)

sum = 0
(25..CAP).each do |t|
  sum += pmf[t]
end
# puts sum
#
#
# puts pmf
# puts opmf

ocrawlpmf = Hash.new(0)
opmf.each do |o, prob|
  puts "#{o} #{prob}"
  ocrawlpmf[o] = ocrawlpmf[o-1] + prob
end

puts opmf.values.inject{|x, y| x + y}
puts pmf.values.inject{|x, y| x + y}

# puts ocrawlpmf

# exit
win_rate = 0
(25..CAP).each do |i|
  prob  = pmf[i]
  under = ocrawlpmf[i]
  # add chance of capping at i * chance that other isn't lower
  win_rate += prob * (1 - under)
  puts "    prob:#{prob} under:#{under} chance:#{prob * (1-under)}"
  puts "\033[33m#{win_rate} from adding #{prob} * #{1.0-under} for #{i}\033[0m"
end
puts
puts win_rate
