//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//使用 struct 来创建一个结构体。结构体和类有很多相同的地方，比如方法和构造器。
//它们之间最大的一个区别就 是结构体是传值，类是传引用。(这个之后考查)
//
//常量的值一旦设定就不能改变
//类型标注是可以不写的，而且个人不认为写是一个好习惯
let 你好 = "你好啊"
//变量可以使用unicode

/* 这是第一个多行注释的开头
    /* 这是第二个被嵌套的多行注释 */
 这是第一个多行注释的结尾 */

//32位平台上，Int和Int32长度相同，UInt和UInt32长度相同
//62位平台上，Int和Int64长度相同，UInt和Uint64长度相同

//2147483648 2的31次方（10位）
//927 337 203 6854 775 808  2的63次方（19位）

//Double 精确度很高，至少有15位数字，而 Float 只有6位数字。
//选择哪个类型取决于你的代码需要处理的值的范围，在两种类型都匹配的情况下，将优先选择 Double 。

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11
//以上全部是17


//类型转换
let twoThousand: UInt16 = 2_000
let one: UInt16 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

//SomeType(ofIntialValue) 是调用swift构造器并传入一个初始值的默认方法
let pi = 3.1415926
let integerPi = Int(pi)
// integerPi 等于 3，所以被推测为 Int 类型
//当用这种方式来初始化一个新的整数值时，浮点值会被截断。也就是说 4.75 会变成 4 ， -3.9 会变成 -3 。


//如果你在需要使用 Bool 类型的地方使用了非布尔值，Swift 的类型安全机制会报错。

//元组
//1.如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线( _ )标记:
let http404Error = (404,"Not Found")
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)") // 输出 "The status code is 404"

//2.给元组中的元素命名后，你可以通过名字来获取这些元素的值:
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")// 输出 "The status code is 200"
print("The status message is \(http200Status.description)") // 输出 "The status message is OK"


//nil
//nil 不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。
//Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中， nil 是一个指向不存在对象的指 针。
//在 Swift 中， nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设 置为 nil ，不只是对象类型。


//断言
//    • 整数类型的下标索引被传入一个自定义下标实现，但是下标索引值可能太小或者太大。
//    • 需要给函数传入一个值，但是非法的值可能导致函数不能正常执行。
//    • 一个可选值现在是 nil ，但是后面的代码运行需要一个非 nil 值。
//断言可能导致你的应用终止运行，所以你应当仔细设计你的代码来让非法条件不会出现。
//然而，在你的应用发布之前，有时候非法条件可能出现，这时使用断言可以快速发现问题。

var threeDoubles = [0.0,0,0]
var otherThreeDoubles = [2.5,2.5,2.5]
otherThreeDoubles.insert(3, at: 1)
threeDoubles.remove(at: 1)
print(threeDoubles + otherThreeDoubles)

for (index,value) in otherThreeDoubles.enumerated() {
    print("\(String(index)):\(value)")
}

/*
 32位系统，vc编译器中，
 
 short占 2 字节，
 
 int 、float、long 都占 4 字节，
 
 只有double 占8 字节
 
 （容易弄错的就是 short  和 long）
 
 
 64位系统中，
 
 Int16, 等于short, 占2个字节. -32768 32767
 
 Int32, 等于int, 占4个字节. -2147483648 2147483647
 
 Int64, 等于long, 占8个字节. -9223372036854775808 9223372036854775807
 
 Int8 ，占用1个字节
 
 */


