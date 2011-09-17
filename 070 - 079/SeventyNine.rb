def place(rules, a)
	for i in 0..2
		for j in 0..2
			next if i == j
			rules[a[i]][ i > j ? 0 : 1] << a[j]
		end
	end
end
def searchConflict(rules, conflicts)
	for current in 0..9
		before = rules[current][0]
		after = rules[current][1]

		for b in before
			conflicts << [current, b] if rules[b][0].index(current) != nil
		end

		for a in after
			conflicts << [current, a] if rules[a][1].index(current) != nil
		end
	end
end
def pivot(numbers, rules, current)
	return if rules[current][0].size == 0 and rules[current][1].size == 0
	puts current.to_s

	before = rules[current][0]
	after = rules[current][1]
	before = before.map{|b| [b, numbers.index(b)]}
	after = after.map{|a| [a, numbers.index(a)]}
	current = [current, numbers.index(current)]
	
	before = before.reject{|b| b[1] < current[1]}
	after = after.reject{|a| a[1] > current[1]}

	indexes = before.map{|b| b[1]} + [current[1]] + after.map{|a| a[1]}
	indexes = indexes.sort
#	puts rules[current[0]].to_s + "rule"
#	puts before.to_s + "bef"
#	puts after.to_s + "aft"
#	puts numbers.to_s + "num"
#	puts indexes.to_s + "ind"
	numbers[indexes[before.size]] = current[0]
	indexes.delete_at(before.size)

	while before.size > 0
		numbers[indexes[0]] = before.pop[0]
		indexes.delete_at(0)
	end
	while after.size > 0
		numbers[indexes[0]] = after.pop[0]
		indexes.delete_at(0)
	end
end
attempts = []
input = File.new("SeventyNine.txt", "r")
while f = input.gets
	attempts << f.chomp.split("").map{|x| Integer(x)}
end
puts attempts.to_s

rules = Array.new(10){Array.new(2){Array.new}}
for a in attempts
	place(rules, a)
end
rules = rules.map{|r| [r[0].uniq, r[1].uniq]}

for i in 0..9
	puts i.to_s + " -> " + rules[i][0].to_s + " <====> " + rules[i][1].to_s
end

conflicts = []
searchConflict(rules, conflicts)

puts conflicts.to_s

numbers = rules[0][0] + [0] + rules[0][1]
for i in 1..9
	pivot(numbers, rules, i)
end
puts numbers.join
