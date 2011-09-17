def check(n)
	needs = [n, 2*n, 3*n, 4*n, 5*n, 6*n]
	needs.map!{|d| convert(d)}
	master = needs[0]
	needs.map!{|x| x == master}
	needs.reject!{|x| x}
	return needs.size == 0
end
def convert(other)
	result = Array.new(10){0}
	other.to_s.split("").each{|a| result[Integer(a)] += 1}
	result
end
count = 1
while true
	puts count if count % 1000 == 0
	(puts count or break) if check(count)
	count += 1
end
