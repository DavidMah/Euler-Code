def generate(n, b, a, table = Hash.new)
	return table[n] if table[n]
	value = 0

	lowfibone = b - a
	lowfibtwo = a - lowfibone

	twobelow = generate(n - b, lowfibone, lowfibtwo, table)
	onebelow = generate(n - a, a, b - a, table)

	value = onebelow + twobelow + (n - b) - 1

	table[n] = value
	return value
end
def shave(n,fibs, table, index = fibs.size - 1)
	return table[n] if table[n]
	while index >= 0
		if fibs[index] < n
			return table[fibs[index]] + shave(n - fibs[index], fibs, table, index) + (n - fibs[index])
		end
		index -= 1
	end
end
before = Time.now

a = 0;
b = 1;
fibs = []
CAP = 10 ** 17
while a <= CAP
	fibs << a + b
	temp = b
	b = a + b
	a = temp
end
top = a

b = b - a
a = a - b

table = Hash.new{false}
table[1] = 1 and table[2] = 2 and table[3] = 3

generate(top, b, a, table)
puts "Result: " + shave(CAP - 1, fibs, table).to_s
puts "Time: " + (Time.now - before).to_s
