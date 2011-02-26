limit = 1999993
list = (0..limit).to_a
current = 2
while current != list.size - 1
	if list[current] != nil
		b = current * 2
		while b < list.size - 1
			list[b] = nil
			b += current
		end
		puts current
	end
	current += 1
end
list.delete_at(0)
list.delete_at(0)
list.compact!
puts list.to_s
puts list.inject{|x, y| x + y}
