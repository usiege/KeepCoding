--[[
假设把某股票的价格按照时间先后顺序存储在数组中，请问买卖该股票一次可能获得的最大利润是多少？
输入: [7,1,5,3,6,4]
输出: 5
解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/gu-piao-de-zui-da-li-run-lcof
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
--]]


function max_profit( prices )
	-- body
	if not prices then return 0 end

	res = 0
	min = prices[0]

	for i,v in ipairs(prices) do
		res = math.max(v-min, res)
		min = math.min(min, v)
	end

	return res
end