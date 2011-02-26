#Problem 36
#The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
#Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#(Please note that the palindromic number, in either base, may not include leading zeros.)

def toBinary(n)
	top = Math.log2(n).to_int
	list = []
	while top >= 0
		n >= 2 ** top ? (list << 1 and n -= 2 ** top) : (list << 0)
		top -= 1
	end
	list.join
end
def palindromic(n)
	n == n.reverse
end
def check(n)
	b = toBinary(n)

	n = n.to_s.split("").map{|x| Integer(x)}
	b = b.to_s.split("").map{|x| Integer(x)}
	return (palindromic(n) and palindromic(b))
end
list = []
for i in 1..999999
	puts i.to_s + ".." if i % 80000 == 0
	list << i if check(i)
end
puts list.inject{|x, y| x + y}
