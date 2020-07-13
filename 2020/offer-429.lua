--[[
给定一个 N 叉树，返回其节点值的层序遍历。 (即从左到右，逐层遍历)。
--]]

res = {}
function dfs( root, depth )
	if not root then return {} end
	if #res <= depth then
		res[#res+1] = {}
	end

	res_depth_len = #res[depth]
	res[depth][res_depth_len+1] = root.val 
	for i,v in ipairs(root.children) do
		dfs(ch, depth + 1)
	end
end


function bfs( root )
	queue = {root}
	while queue do
		nxt = {}
		tmp = {}
		for i,v in ipairs(queue) do
			tmp[#tmp+1] = v.val
			for j,ch in ipairs(v.children) do
				nxt[#nxt+1] = ch
			end
		end
		res[#res+1] = tmp
		queue = nxt
	end
end
