MAXN = 1000
fa = [] * MAXN

# 将父节点设为自己
def init(n):
	for x in xrange(1,n):
		fa[x] = x



# 查询
def find(x):
	if fa[x] == x:
		return x
	else:
		return find(fa[x])


# 合并
def merge(i, j):
	fa[find(i)] = find(j)


# 路径压缩
def find(x):
	if x == fa[x]:
		return x
	else:
		fa[x] = find(fa[x]) # 父节点设为根节点
		return fa[x]


def find(x):
	return x == fa[x] and x or (fa[x] = find(fa[x]))


'''
我们用一个数组rank[]记录每个根节点对应的树的深度（如果不是根节点，其rank相当于以它作为根节点的子树的深度）。
一开始，把所有元素的rank（秩）设为1。合并时比较两个根节点，把rank较小者往较大者上合并。路径压缩和按秩合并如果一起使用，
时间复杂度接近 [公式] ，但是很可能会破坏rank的准确性。
'''

rank = [] * MAXN

def init(n):
	for x in xrange(1, n):
		fa[x] = x
		rank[x] = 1


