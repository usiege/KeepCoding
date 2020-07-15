--[[
/********************************************************************************** 
* 
* Given a string, find the length of the longest substring without repeating characters. 
* For example, the longest substring without repeating letters for "abcabcbb" is "abc", 
* which the length is 3. For "bbbbb" the longest substring is "b", with the length of 1.
*               
**********************************************************************************/
--]]

function length_of_logest_substring( s )
	-- body
	maxLen = 0
	m = {}
	lastRepeatPos = 0
	for i,v in ipairs(s) do
		print(i,v)
		if m[v] ~= nil and lastRepeatPos < m[v] then
			lastRepeatPos = m[v]
		end
		if i - lastRepeatPos > maxLen then
			maxLen = i - lastRepeatPos
		end

		m[v] = i
	end

	return maxLen
end