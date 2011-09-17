def attack(a, count, values, success = Array.new(values.size))
	for i in ("a".ord)..("z".ord)
		for j in 0...values.size
			next if success[j].kind_of(String)
			val = values[j]
			values[j] = (i - val).abs.chr
		end
		puts values.to_s
		values
	end
end
dict = Hash.new{false}
dictionary = File.new("/usr/share/dict/words", "r")
while f = dictionary.gets
	word = f.chomp
	dict[word] = true
end

target = File.new("FiftyNine.txt", "r")
values = target.gets.chomp.split(",").map{|x| Integer(x)}
success = Array.new(values.size){false}
puts values.to_s
