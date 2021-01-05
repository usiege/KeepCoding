--[[
请实现一个函数，把字符串 s 中的每个空格替换成"%20"。

示例 1：

输入：s = "We are happy."
输出："We%20are%20happy."
--]]

function replace_string( s )
	if false then 
		s = string.gsub(s, " ", "%%20")
		return s
	else
		res = ""
		for i=1,#s do
			st = string.sub(s, i, i)
			-- print(st)
			if st == " " then
				res = res.."%%20"
			else
				res = res..st
			end
		end
		return res
	end
end


print(replace_string("We are happy."))