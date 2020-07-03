--[[
输入一个整型数组，数组里有正数也有负数。数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。
要求时间复杂度为O(n)。

示例1:

输入: nums = [-2,1,-3,4,-1,2,1,-5,4]
输出: 6
解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。

--]]

--require math

function maxn( ps )
	-- body
	local max = nil
	for i,v in ipairs(ps) do
		if max == nil then 
			max = v
		end
		if max < v then
			max = v
		end
	end
	return max
end

function res( nums )
	-- body
	--length = #nums
	ps = {}
	ps[1] = nums[1]

	for i=2, #nums do
		ps[i] = math.max(ps[i-1]+nums[i], nums[i])
	end

	-- for i,v in ipairs(nums) do
		
	-- end
	--table.maxn Lua5.2之后该方法已经不存在了
	return maxn(ps)
end

nums = {-2,1,-3,4,-1,2,1,-5,4}
print(res(nums))