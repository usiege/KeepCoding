--[[
设计一个算法，找出数组中最小的k个数。以任意顺序返回这k个数均可。
输入： arr = [1,3,5,7,2,4,6,8], k = 4
输出： [1,2,3,4]
--]]

function smallest_k( arr, k )
	-- body
	l = 1, r = #arr


end


--[[--
-   orderByBubbling: 冒泡排序
-   @param: t, 
-    @return: list - table
]]
function orderByBubbling(t)
    for i = 1, #t do
        for j = #t, i + 1, -1 do
            if t[j - 1] > t[j] then
                swap(t, j, j - 1)
                printT(t)
            end
        end
    end
    return t
end


--[[--
-   partition: 获得快排中介值位置
-   @param: list, low, high - 参数描述
-   @return: pivotKeyIndex - 中介值索引
]]
function partition(list, low, high)
    local low = low
    local high = high
    local pivotKey = list[low] -- 定义一个中介值

    -- 下面将中介值移动到列表的中间
    -- 当左索引与右索引相邻时停止循环
    while low < high do
        -- 假如当前右值大于等于中介值则右索引左移
        -- 否则交换中介值和右值位置
        while low < high and list[high] >= pivotKey do
            high = high - 1
        end
        swap(list, low, high)

        -- 假如当前左值小于等于中介值则左索引右移
        -- 否则交换中介值和左值位置
        while low < high and list[low] <= pivotKey do
            low = low + 1
        end
        swap(list, low, high)
    end
    return low
end

--[[--
-   orderByQuick: 快速排序
-   @param: list, low, high - 参数描述
-    @return: list - table
]]
function orderByQuick(list, low, high)
    if low < high then
        -- 返回列表中中介值所在的位置，该位置左边的值都小于等于中介值，右边的值都大于等于中介值
        local pivotKeyIndex = partition(list, low, high)
        -- 分别将中介值左右两边的列表递归快排
        orderByQuick(list, low, pivotKeyIndex - 1)
        orderByQuick(list, pivotKeyIndex + 1, high)
    end
end