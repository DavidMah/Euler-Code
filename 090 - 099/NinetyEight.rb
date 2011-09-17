def check(anagram, squares, possibles)
	digits = anagram[0].length
	reallybest = -1
	
	for s in squares
		digs = Math.log10(s).to_i + 1
		next if digs < digits
		break if digs > digits
		best = s
		nums = s.to_s.split("").map{|x| Integer(x)}

		failure = false

		map = Hash.new{false}
		for i in 0...digits
			failure = true if (map[anagram[0][i]] != false and map[anagram[0][i]] != nums[i]) or (map[nums[i]] != false and map[nums[i]] != anagram[0][i])
			map[anagram[0][i]] = nums[i]
			map[nums[i]] = anagram[0][i]
		end

		for w in 1...anagram.size
			break if failure
			num = 0
			for i in 0...digits
				num = 10 * num + map[anagram[w][i]]
			end
			puts "\t\t" + map.to_s if possibles[num] != false
			puts "\t" + anagram[w] + " " +  num.to_s if possibles[num] != false
			failure = true if not possibles[num]
			failure = true if Math.log10(num).to_i + 1 != digits
			best = num if num > best
		end
		reallybest = best if not failure
	end
	return reallybest
end
def generateAnagrams
	def crawl(index, letters)
		result = []
		firstWord = letters[index]
		while letters[index][1] == firstWord[1]
			result << letters[index][0]
			index += 1
			break if letters[index] == nil
		end
		return [result, index] if result.size > 1
		return [-1, index]
	end
	input = File.new("NinetyEight.txt", "r")
	words = input.gets.chomp.split(',').map{|w| w[1...(w.size - 1)]}
	for i in 0...words.size
		words[i] = [i, words[i]]
	end
	letters = words.map{|w| [w[0], w[1].split("").sort.join]}.sort{|x, y| x[1] <=> y[1]}
	anagrams = []
	i = 0
	while i < words.size
		result = crawl(i, letters)
		anagrams << result[0] if result[0] != -1
		i = result[1]
	end
	anagrams = anagrams.map{|wos| wos.map{|i| words[i][1]}}
	return anagrams
end
def generateSquares
	squares = Array.new
	possibles = Hash.new{false}
	for i in 1..5000
		squares << i ** 2
		possibles[i ** 2] = i
	end
	return [squares, possibles]
end
anagrams = generateAnagrams
sq = generateSquares
squares = sq[0]
possibles = sq[1]
best = 0
for a in anagrams
	result = check(a, squares, possibles)
	puts a.to_s + " - " + result.to_s
	best = result if result > best
end
puts best
puts possibles[best]
