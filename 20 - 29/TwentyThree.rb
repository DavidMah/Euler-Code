def abundancy(n)
	#This is incorrect -- see abunds
	original = n
	list = [1]
	i = 2
	while i < n
		list << i << n / i and n = n / i and i -= 1 if n / i * i == n
		i += 1
	end
	list.sort!	
	i = 1
	while i < list.size - 1
		if list[i] == list[i + 1]
			quantity = 1
			while list[i+1] != nil and list[i] == list[i + 1]
				quantity += 1
				i += 1
			end
			for j in 0..(quantity - 1)
				list[i - j] = list[i - quantity + 1] ** (j + 1)
			end
		end
		i += 1
	end
	list.uniq!
	list.sort!
	list.pop if original == list[list.size - 1]

	quality = list.inject{|x, y| x + y}
#	puts original.to_s + " " + list.to_s if quality > n
	quality

end
def abunds(n)
	original = n
	list = []
	for i in 1..(n-1)
		list << i if n / i * i == n
	end
	list.inject{|x, y| x + y}
end
sum = 0
abundants = []
for i in 2..28124
	abundants << i if abunds(i) > i
end
puts abundants.to_s
antis = []
for i in abundants
	for j in abundants
		antis << i + j if i + j < 50000
	end
end
puts "------------------"
antis.sort!
antis.uniq!
puts antis.to_s
i = 1
results = []
while i < 28128
	if i == antis[0]
#		puts i.to_s + " deleted " + antis[0].to_s
		antis.delete_at(0)
	else
		results << i
	end
	i += 1
end
#puts antis.to_s
#puts "-------------"
#puts results.to_s
puts results.inject{|x, y| x + y}
