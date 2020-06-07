other = { foo = 3 }
t = setmetatable({ },{ __index = other})
print(type(t))

---[[
print(t.foo )--3,现在__index包含的表{ foo = 3}查找
print(t.bar) --nil,没找到

other = function ( t,k )	
	if k == "foo"
	then return 0
	end	
end
t = setmetatable({ },{__index = other})
print(t.foo)

--如果__index 包含一个函数，当被它调用时；
--会把被访问的表和索引作为参数传入；

print "-------------------------------------------------"

other = { }
t = setmetatable({ },{ __newindex = other })
t.foo = 3 
--t里没有foo,查看__newindex，
--并把foo = 3传给other
--并没有给t里的foo赋值
print(other.foo) --3
print(t.foo) -- nil

t = setmetatable({ },{
	__newindex = function ( t,key,value )
		-- body
		if type(value) == "number" then
			rawset(t,key,value * value)
		else
			rawset(t,key,value)
		end
	end
	})
--当在t里创建新的索引时,
--如果值是number，这个值会平方，否则什么也不做

--[[ 在上面的例子里, t[key] = value * value将再次调用__newindex
函数，这让你的代码陷入死循环。
使用rawset(t, key, value * value) 可以避免。]]

print(rawget(t,foo))
print(type(t))
print "---------------------------------------------"

t = setmetatable({ 1, 2, 3 }, {
	__mul = function ( t,other )
		new = { }
		for i=1,other do
			for _,v in ipairs(t) do
				table.insert(new,v) 
			end
		end
		return new
	end
	})

t = setmetatable({1,2,3},{
	__tostring = function ( t )
		sum = 0
		for _,v in pairs(t) do
			sum = sum + v
			print(i,v)
		end
		return "Sum:"..sum
	end
	})
--最后一个是 __tostring
--如果实现它，那么tostring 可以把表转化为string, 非常方便类似print的函数使用
print(tostring(t))

