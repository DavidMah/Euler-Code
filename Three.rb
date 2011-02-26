def isPrime(n)
	for i in 2..(n / 2 + 1)
		return false if n / i * i == n
	end
	true
end
number = 600851475143
list = []
i = 2
puts number
while i < number
	puts i if i % 1000000 == 0
	list << i and number = number / i and list << number and puts i.to_s + " " + number.to_s and i -= 1 if number / i * i == number 
	i+= 1
end
list.reverse!
for num in list
	puts num if isPrime(num)
end
