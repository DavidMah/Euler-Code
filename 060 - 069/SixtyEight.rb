def read(nums)
	#[out, in, out, in, out, in, out, in, out, in]
	i = 0
	result = ""
	while i < nums.size
		result += nums[i].to_s
		result += nums[i + 1 % nums.size].to_s
		result += nums[(i + 3) % nums.size].to_s
		i += 2
	end
	return result
end
puts read([4, 3, 6, 2, 5, 1])
