-- 闭包
--当一个函数使用到外部的局部变量时，会特别的产生的容器保存这些局部变量。
--这种容器被称为闭包(Closure)。

--[[
在函数的调用过程中：
首先检查当前调用的状态表，如果找到字段(变量名)，直接使用。
如果状态表中查询不到，并且该函数有闭包，查找闭包中的字段(变量名)，存在，直接使用。
如果上面都查不多，使用全局表的字段值，如果不存在，即使用nil做为值。
保存和访问的机制同样。
]]

--[[
do
	local ct = collectgarbage
	local clock = os.clock

	function test( func, n, ...)
		-- body
		ct() ct("stop")

		local mem = ct("count")
		local start = clock()

		for i=1,n do
			func( ... )
		end

		print("Cost [Time]", clock() - start, "[Memory]", ct("count") - mem)

		ct("restart")
	end

end
]]

var = 123 

-- 全局表 
function a() 
   local f 
   for i = 1, 10000 do 
      f = var 
   end 
end 

-- 闭包 
do 
   local var = 123 

   function b() 
      local f 
      for i = 1, 10000 do 
         f = var 
      end 
   end 
end 

-- 状态表 
function c() 
   local var = 123 

   local f 
   for i = 1, 10000 do 
      f = var 
   end 
end


--匿名函数 迭代器 范型for

function getDice( n, side, add )
	n = n or 1
	side = side or 6 
	add = add or 0

	return function ( ... )
		local  ret = 0

		for i=1,n do
			ret = ret + math.random(side)
		end

		return ret + add
	end
end

dice = getDice(3, 6, 3)

print(dice())
print(dice())
print(dice())

--注意，虽然同样是参数变量，可变参数 ... 不能作为闭包的内容。

print "--------------------------------------------"

a = {"one", "two", "three", "four"} 
for k, v in pairs(_G), a, 2 do 
    print(k, v) 
end

function func( ... )
	-- body
end

--[[没看懂]]
for k, v in func, tbl, index do 
    -- 循环体 
end 

-- 转换成while就是 
do 
    local k, v = func( tbl, index ) 
   index = k  -- k，v可以在循环体内被改变 

    while index do 
         -- 循环体 
         k, v  = func( tbl, k ) 
         index = k 
    end 
end

for k,v in next,a,2 do
  print(k,v)
end

--迭代器，实际上只是会返回值的函数，只因为使用它是为了被for循环调用，所以称为迭代器。

function mypairs( a ) 
    return function ( a, i ) 
        i = i or 0 
        if i < #a then 
            return i + 1, a[ i + 1 ] 
        end 
     end, a, nil 
end 

for i, v in mypairs(a) do print(i, v) end









