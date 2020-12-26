--[[
在排序数组中查找数字
统计一个数字在排序数组中出现的次数。
--]]

function search_count( nums, target )
	-- body
	count = 0
	l = 1, r = #nums
	while l < r do
		mid = (l + r) // 2
		if nums[mid] > target then
			l = mid + 1
		else if nums[mid] < target then
			r = mid 
		else
			break
		end
	end

	while l < r do
		if nums[l] == target then
			count = count + 1
		end
		l = l + 1
	end

	return count
end