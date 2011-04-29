def runTest(s)
	first = s.split(" ")
	second = [] << first.pop << first.pop << first.pop << first.pop << first.pop
	return compareHands(first, second) > 0 ? 1 : 0
end
def compareHands(a, b)
	result = royalFlush(a) - royalFlush(b)
	puts 1
	return result if result != 0
	result = straightFlush(a) - straightFlush(b)
	puts 2
	return result if result != 0
	result = fourKind(a) - fourKind(b)
	puts 3
	return result if result != 0
	result = fullHouse(a) - fullHouse(b)
	puts 4
	return result if result != 0
	result = flush(a) - flush(b)
	puts 5
	return result if result != 0
	result = straight(a) - straight(b)
	puts 6
	return result if result != 0
	result = threeKind(a) - threeKind(b)
	puts 7
	return result if result != 0
	result = twoPair(a) - twoPair(b)
	puts 8
	return result if result != 0
	result = onePair(a) - onePair(b)
	puts 9
	return result if result != 0
	puts 10
	return highCard(a) - highCard(b)

end
def royalFlush(hand)
	count = Array.new(5){0}
	suit = hand[0][1]
	for i in 0...hand.size
		card = convert(hand[i])
		count[card - 8] += 1 if card > 8
	end
	return count == ([1] * 5) ? 1 : -1
end
def straightFlush(hand)
	hand = hand.sort
	suit = hand[0][1]
	past = convert(hand[0][0])
	for i in 1...hand.size
		return -1 if past + 1 != convert(hand[i][0])
		return -1 if suit != hand[i][1]
		past += 1
	end
	return highCard(hand)
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
		found += 1 if count[i] == 3 or count[i] == 2
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
	past = convert(hand[0][0])
	for i in 1...hand.size
		return -1 if past + 1 != convert(hand[i][0])
		past += 1
	end
	return 1
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
	hand = hand.sort
	power = 0
	for i in 0...hand.size
		card = convert(hand[i][0])
		power += card * 10 ** i
	end
	return power
end
def convert(card)
	card = card[0]
	card = 8 if card == "T"
	card = 9 if card == "J"
	card = 10 if card == "Q"
	card = 11 if card == "K"
	card = 12 if card == "A"
	return Integer(card)
end
input = File.new("FiftyFour.txt", "r")
wins = 0
while game = input.gets
	game = game.chomp
	wins += runTest(game)
end
puts wins
