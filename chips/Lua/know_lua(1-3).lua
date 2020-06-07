print("hello world!")

pt = print
pt('hello world again!')

print(print)

print '-------------------------------------------------------'

-- 不要在意下面的函数定义 
local function printValueAndType(value) 
    print("[Value]", value,  "[Type]",  type(value)) 
end 

local function newproxy( isTrue)
	-- body
end

-- 注意下面各个类型值的书写 
printValueAndType( nil ) 
printValueAndType( true ) 
printValueAndType( 123 ) 
printValueAndType( "Hello World" ) 
printValueAndType( function() end ) 
printValueAndType( {} ) 
printValueAndType( coroutine.create( function() end ) ) 
--printValueAndType( newproxy(true) )

print '-------------------------------------------------------'

a,b,c = 1,2
print (a,b,c)

a,b,c = 1,2,3,4,5
print(a,b,c)

print( "10 > 9", 10 > 9 ) 
print( "10 < 9", 10 < 9 ) 
print( "10 == 9", 10 == 9 ) 
print( "10 ~= 9", 10 ~= 9 )

print( "not 1", not 1 ) 
print( "not nil", not nil ) 
print( "1 and 2", 1 and 2 ) 
print(" 1 or 2", 1 or 2 )

a = 1 and print( "第一次调用print语句" ) 
a = 1 or print( "第二次调用print语句" ) 
a = false and print( "第三次调用print语句" ) 
a = false or print( "第四次调用print语句" )
--[[你会注意到，只有第一次和第四次的print函数被调用了，
lua在执行逻辑运算时，会根据前值判定，有没有必要取后值，
如果结果是前值的话，那么后值连计算都没有必要了。]]--

print( "print is " .. tostring( print ) ) 
print( "boolean is " .. tostring( true ) .. " and " .. tostring( false ) )

greet = function( name ) 
    print("你好 " .. name) 
end 

greet( "Kurapica" )  -- 你好 Kurapica

--函数多值返回
ret = function ( ... )
	return 1,2,3,4
end

print(ret())
print(ret(),5) --这个设定是为了避免多值返回情况破坏了参数的位置，造成程序的不稳定。
print((ret())) --将返回值用括号括起来的意思，是只取第一个返回值，注意和函数调用使用的括号区分。

--可变参数函数
sum = function ( ... )
	-- body
	print('总数',select('#',...))

	local total = 0
	for i=1,select('#',...) do
		print(i)
		total = total + select(i,...)
	end

	print("总计",total)
end

sum(1,2,3,4,5,7,10)

--select( "#", ... ) - 获取可变参数的数目
--select( i, ... ) - 获取第 i 个参数，及之后的参数;
--一般如果用单变量接收的话，可以认为它就是用来获取第i个参数的。

-- http://bbs.ngacn.cc/read.php?tid=6621402




