--我们用到的索引是数字索引，而且是顺序下来的(不能中断)，这种table被称为顺序表；
--顺序表之外的其他表可以称为哈希表(hash table)，这两种表在内存中的保存方式不太一样；

--哈希表
--[[
table的索引
1.没有符号包围时：表字符串；
2.中括号包围时：中括号里是什么，什么就是key；
3.若索引被当作字符串来用，存取可以使用点语法；
]]

tbl = { 
   [0] = "zero",      -- 0    : "zero" 
   a = "A",         -- "a"  : "A" 
   ["bb"] = "BB",      -- "bb" : "BB" 
   "one",            -- 1    : "one" 
   "two",            -- 2    : "two" 
   "three",         -- 3    : "three" 
   [print] = "func",   -- print: "func" 
   print = print,      -- "print": print 
   [true] = "True",   -- true : "True" 
} 

print(_G,_G._G,_G._G._G)
print(print,_G.print)

a = "Hello"
print(a,_G.a)

--[[
table: 0x7fc249502730	table: 0x7fc249502730	table: 0x7fc249502730
function: 0x10eae5b70	function: 0x10eae5b70
Hello	Hello
]]

--[[
当我们定义变量时，这些变量都被保存在了 _G 这个 table 中
_G被称为公共环境表，Lua附带的常用函数等都保存在这个table中

]]
-- "b"
a = "b"
print(_G["a"])

print "--------------------------------------------"

-- -- 1. 顺序范型for 
-- for index, value in ipairs( --[[顺序表]] ) do 
--     -- 循环体 
-- end 

-- -- 2. 哈希用范型for 
-- for field, value in pairs( --[[哈希表]] ) do 
--     -- 循环体 
-- end

local i = 1
for k,v in pairs(_G) do
	-- select(i,_G)
      -- print(type(k))
      print("我是第".. i .."个:" .. type(v))
      if type(v)=="table" then
        print( k .."内部")
        for m,n in pairs(v) do
          print(m,n)
        end
      end

      -- print(k,v)
	-- if(i < 100)  then print(k,v) end
	i = i+1
end

---[[
print "--------------------------------------------"

-- { ... } 和 unpack是一对逆反操作 
function ret( ... ) 
    local tbl = { ... } 
    return table.unpack( tbl ) 
end 

function ret2( ... ) 
    local tbl = { ... } 
    return tbl
end 
print( ret( 1, 2, 3, 4, 5 ) )  -- 1  2  3  4  5 
print( ret2(1,2,3,4,5) )
print( table.unpack { "one", "two", "three" } )

-- Check the versions of Lua you are using. In Lua 5.1, unpack was a global, 
-- but in 5.2 it's been moved to table.unpack. 
-- You might be using Lua 5.1 in the command line while embedding 5.2. –

print "--------------------------------------------"
a = {1,2,3, a="kiss"}
print(table.unpack(a))
print(_G)

---[[
function a() 
    return b    -- 将函数b作为返回值，不是尾调用 
    return 1, 2, b()   -- 有多个返回值的情况，也不是尾调用 
    b()            -- 虽然最后一行是调用b(),但不是写在return后面的也不是尾调用 
    return b()  -- 在return关键字后面调用函数，就是尾调用 
end
--]]

--]]

print "--------------------------------------------"
-- http://bbs.ngacn.cc/read.php?tid=6621402

