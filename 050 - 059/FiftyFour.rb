def runTest(s)
	first = s.split(" ")
	second = [] << first.pop << first.pop << first.pop << first.pop << first.pop
	return compareHands(first, second) > 0 ? 1 : 0
end
def compareHands(a, b)
	puts 1.to_s + "royalflush"
	result = royalFlush(a) - royalFlush(b)
	return result if result != 0

	puts 2.to_s + "straightflush"
	result = straightFlush(a) - straightFlush(b)
	return result if result != 0

	puts 3.to_s + "fourkind"
	result = fourKind(a) - fourKind(b)
	return result if result != 0

	puts 4.to_s + "fullhouse"
	result = fullHouse(a) - fullHouse(b)
	return result if result != 0

	puts 5.to_s + "flush"
	result = flush(a) - flush(b)
	return result if result != 0

	puts 6.to_s + "straight"
	result = straight(a) - straight(b)
	return result if result != 0

	puts 7.to_s + "threekind"
	result = threeKind(a) - threeKind(b)
	return result if result != 0

	puts 8.to_s + "twopair"
	result = twoPair(a) - twoPair(b)
	return result if result != 0

	puts 9.to_s + "onepair"
	result = onePair(a) - onePair(b)
	return result if result != 0

	puts 10.to_s + "highcard"
	return highCard(a) - highCard(b)

end
def royalFlush(hand)
	count = Array.new(5){0}
	suit = hand[0][1]
	for i in 0...hand.size
		card = convert(hand[i])
		return -1 if hand[i][1] != suit
		count[card - 8] += 1 if card >= 8
	end
	return count == ([1] * 5) ? 1 : -1
end
def straightFlush(hand)
	return highCard(hand) if flush(hand) != -1 and straight(hand) != -1
	return -1
end
def fourKind(hand)
	hand = hand.sort
	count = Array.new(13){0}
	for i in 0...hand.size
		card = convert(hand[i])
		count[card] += 1
	end
	for i in 0...count.size
		return i if count[i] == 4
	end
	return -1
end
def fullHouse(hand)
	hand = hand.sort
	count = Array.new(13){0}
	for i in 0...hand.size
		card = convert(hand[i])
		count[card] += 1
	end
	found = 0
	for i in 0...count.size
		found += 1 and break if count[i] == 3
	end
	for i in 0...count.size
		found += 1 and break if count[i] == 2
	end
	return found == 2 ? 1 : -1
end
def flush(hand)
	hand = hand.sort
	suit = hand[0][1]
	for i in 1...hand.size
		return -1 if suit != hand[i][1]
	end
	return highCard(hand)
end
def straight(hand)
	hand = hand.sort
	count = Array.new(13){0}
	for i in 0...hand.size
		count[convert(hand[i])] = 1
	end
	num = 0
	for i in 0..19
		num = (count[i % 13] == 1 ? num + 1 : 0)
		return 1 if num == 5
	end
	return -1
end
def threeKind(hand)
	hand = hand.sort
	count = Array.new(13){0}
	for i in 0...hand.size
		card = convert(hand[i])
		count[card] += 1
	end
	for i in 0...count.size
		return i if count[i] == 3
	end
	return -1
end
def twoPair(hand)
	hand = hand.sort
	count = Array.new(13){0}
	for i in 0...hand.size
		card = convert(hand[i])
		count[card] += 1
	end
	found = 0
	best = -1
	for i in 0...count.size
		found += 1 and best = (best < i ? i : best) if count[i] == 2
	end
	return found == 2 ? best : -1
end
def onePair(hand)
	hand = hand.sort
	count = Array.new(13){0}
	for i in 0...hand.size
		card = convert(hand[i])
		count[card] += 1
	end
	for i in 0...count.size
		return i if count[i] == 2
	end
	return -1
end
def highCard(hand)
	hand = hand.sort.reverse
	power = 0
	for i in 0...hand.size
		card = convert(hand[i][0])
		power += card * 100 ** i
	end
	return power
end
def convert(card)
	card = card[0]
	card = 10 if card == "T"
	card = 11 if card == "J"
	card = 12 if card == "Q"
	card = 13 if card == "K"
	card = 14 if card == "A"
	return Integer(card) - 2
end
#puts runTest(ARGV[0..9].join(" "))
input = File.new("FiftyFour.txt", "r")
wins = 0
while game = input.gets
	game = game.chomp
	wins += runTest(game)
end
puts wins
