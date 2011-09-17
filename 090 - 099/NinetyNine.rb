
data = []
input = File.new("NinetyNine.txt", "r")
while f = input.gets
	data << (f.chomp.split(",").map{|x| Integer(x)})
end
puts data.size

best = 1
bestindex = 1
i = 1
for d in data
	result = d[1] * Math.log10(d[0])
	bestindex = i if result > best
	best = result if result > best
	i += 1
end
puts best
puts bestindex
