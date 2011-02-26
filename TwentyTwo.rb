def magic(names)
	#separate text into names and sort
	names = names.split('"').reject{|x| x == ","}.sort
	puts names.to_s
	#separate names into values
	names = names.map{|x| x.split("").map{|x| x.ord - "A".ord + 1}}
	#assign name values
	names = names.map{|x| x.inject{|x, y| x + y}}
	#concatenate name values
	puts names.to_s
	sum = 0
	for i in 0..(names.size - 1)
		sum += (i + 1) * names[i]
	end
	sum
end
file = File.new("TwentyTwo.txt", "r")
names = file.gets.chomp
puts magic(names)
