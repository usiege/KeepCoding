--[[

/********************************************************************************** 
* 
* There are two sorted arrays A and B of size m and n respectively. 
* Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
*               
**********************************************************************************/
--]]

-- 这道题有点难

-- 归并排序 O(m*n)
function find_median_sorted_array( nums1, nums2 )
	-- body
	assert(nums1~=nil, "nums1 is nil")
	assert(nums2~=nil, "nums2 is nil")

	m = #nums1
	n = #nums2

	if m == 0 then
		return n%2 == 1 and nums2[n//2] or 
		(nums2[n//2] + nums2[n//2+1])/2 
	end

	if n == 0 then
		return m%2 == 1 and nums1[m//2] or 
		(nums1[m//2] + nums1[m//2+1])/2 
	end

	i, j = 1, 1
	nums = {}
	while i <= m and j <=n do --O(m*n)
		if nums1[i] <= nums2[j] then
			table.insert(nums, nums1[i])
			i = i+1
		else
			table.insert(nums, nums2[j])
			j = j+1
		end
	end

	if i>m then
		for j=j,n do
			table.insert(nums, nums2[j])
		end
	else if j>n then
		for i=i,m do
			table.insert(nums, nums1[i])
		end
	end

	l = #nums
	return l%2==1 and nums[l//2] or
	(nums[l//2]+nums[l//2+1])/2
end

-- 二分查找
-- https://www.cnblogs.com/grandyang/p/4465932.html
-- 这里有几种解法
function find_median_sorted_array( nums1, nums2 )
	assert(nums1~=nil, "nums1 is nil")
	assert(nums2~=nil, "nums2 is nil")

	m = #nums1
	n = #nums2

	if m == 0 then
		return n%2 == 1 and nums2[n//2] or 
		(nums2[n//2] + nums2[n//2+1])/2 
	end

	if n == 0 then
		return m%2 == 1 and nums1[m//2] or 
		(nums1[m//2] + nums1[m//2+1])/2 
	end

	-- 待续
end



