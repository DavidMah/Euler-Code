a = 1
b = 1
c = 1
for i in 1..998
	for j in 1..(1000 - i)
		k = 1000 - i - j
			puts i * j * k if i * i + j * j == k * k
	end
end
