--[[
* Given an array of integers, find two numbers such that they add up to a specific target number.
* 
* The function twoSum should return indices of the two numbers such that they add up to the target, 
* where index1 must be less than index2. Please note that your returned answers (both index1 and index2) 
* are not zero-based.
* 
* You may assume that each input would have exactly one solution.
* 
* Input: numbers={2, 7, 11, 15}, target=9
* Output: index1=1, index2=2
--]]


function two_sum( numbers, target )
	-- body
	index1, index2 = nil, nil
	for i,v in ipairs(numbers) do
		seed = target - v
		if seed_in_numbers(numbers, seed)[1] then
			index1 = seed
			index2 = seed_in_numbers(numbers, seed)[2]
			break
		end
	end

	return index1, index2
end

function seed_in_numbers( numbers, seed )
	-- body
	i_have = false
	index = nil
	for i,v in ipairs(numbers) do
		if numbers[i] == v then
			i_have = true
			index = i
			break
		end
	end
	return i_have, index
end