puts "Give Limit!" or exit if ARGV.size == 0
a = Time.now.nsec
#puts "result: " + (1...Integer(ARGV[0])).to_a.reject{|x| not (x % 3 == 0 or x % 5 == 0)}.inject{|x, y| x + y}.to_s
sum = 0
for i in 1...Integer(ARGV[0])
	puts i if i % 1000000 == 0
	sum += i if i % 3 == 0 or i % 5 == 0
end
puts "nanosecs:" + (Time.now.nsec - a).to_s
