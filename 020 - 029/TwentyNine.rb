list = []
for a in 2..100
	for b in 2..100
		list << a **b
	end
end
list.sort!
list.uniq!
puts list.size
