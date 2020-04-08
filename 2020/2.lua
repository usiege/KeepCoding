--[[
/********************************************************************************** 
* 
* You are given two linked lists representing two non-negative numbers. 
* The digits are stored in reverse order and each of their nodes contain a single digit. 
* Add the two numbers and return it as a linked list.
* 
* Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
* Output: 7 -> 0 -> 8
*               
**********************************************************************************/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
 --]]

list = nil
list = { value = 0, next = list}

function add_two_numbers( list1, list2 )
	-- body
	if list1 == nil or list2 = nil then
		return list1 or list2
	end

	list = { value = 0, next = nil }
	tmp = list
	carry = 0
	while list1 != nil || list2 != nil do
		x = list1.value or 0
		y = list2.value or 0

		sum = carry + x + y

		node = { value = sum % 10, next = nil }
		
		tmp.next = node
		tmp.value = node.value
		tmp = node
		--[[
		tmp = node
		tmp = node.next
		--]]

		
		carry = sum // 10
	end

	if carry > 0 then
		node = { value = carry % 10, next = nil }
		tmp.next = node
	end

	return list
end