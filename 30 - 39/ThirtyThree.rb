def cancellable(pair)
	return false if pair[0] == pair[1]
	real = pair[0] * 1.0 / pair[1]
	num = [pair[0] / 10, pair[0] % 10]
	den = [pair[1] / 10, pair[1] % 10]
	return false if (num[0] * 1.0 / den[0]) == (num[1] * 1.0 / den[1])
	#return true if num[1] * 1.0 / den[0] == real
	return true if num[0] * 1.0 / den[1] == real and num[1] == den[0]
	return false
end
answers = []
for i in 10..99#denominator
	for j in 10..99#numerator
		break if j > i
		fraction = [j, i]
		answers << fraction if cancellable(fraction)
	end
end
result = answers.inject{|x, y| [x[0] * y[0], x[1] * y[1]]}
puts result[1] * 1.0 / result[0]
