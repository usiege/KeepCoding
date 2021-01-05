#!/usr/bin/python

'''
用快排找到数组前k大个数，以arr[k]分界
'''

def smallest_k(arr, k):
	left = 0, right = len(arr) - 1
	while left != k:
		pivot = arr[left]
		low = left
		high = right
		while low < high && arr[high] >= pivot:
			high -= 1	// 从后往前找到第一个小于pivot的数换到low
		arr[left] = arr[high]
		while low < high && arr[low] <= pivot:
			low += 1 //从前往向找到第一个大于pivot的数
		arr[high] = arr[low]

		arr[low] = pivot //确定pivot位置
		if low == k:
			left = low
		elif low > k:
			right = low - 1
		else:
			left = low + 1


	return arr[:k]