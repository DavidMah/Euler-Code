def hell(form, chosen = 0)

	if chosen == 9
		num = Integer(form.join)
		puts num
		result = Math.sqrt(num)
		puts result.to_i if result == result.to_i
		return result == result.to_i
	end
	for i in 0...form.size
		next if form[i] != nil
		for j in 0..9
			form[i] = j
			return true if hell(form, chosen + 1)
			form[i] = nil
		end
	end
	return false 
end
form = [1, nil, 2, nil, 3, nil, 4, nil, 5, nil, 6, nil, 7, nil, 8, nil, 9, nil, 0]
form = form.map{|a| a == nil ? nil : a.to_s}
puts form.to_s
hell(form)
