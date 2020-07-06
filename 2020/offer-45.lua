--[[
输入一个非负整数数组，把数组里所有数字拼接起来排成一个数，
打印能拼接出的所有数字中最小的一个。

示例 1:

输入: [10,2]
输出: "102"

说明:

    输出结果可能非常大，所以你需要返回一个字符串而不是整数
    拼接起来的数字可能会有前导 0，最后结果不需要去掉前导 0
--]]

function min_number( nums )
	
	function compare( x, y )
		lx, ly = #x, #y
		if lx == ly then
			return x > y
		end
		return x*10^ly + y > y*10^lx + x
	end


	for i=l,0,-1 do
		for j=1,i-1 do
			if compare(nums[j], nums[j+1]) then
				nums[j], nums[j+1] = nums[j+1], nums[j]
			end
		end
	end

	res = ''
	for i,v in ipairs(nums) do
		res = res .. v
	end

	return res
end