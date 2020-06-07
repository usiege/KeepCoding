//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//while标签
//如果上述的 break 语句没有使用 gameLoop 标签，那么它将会中断 switch 语句而不是 while 循环。
//使用标签清晰的表明了 break 想要中断的是哪个代码块。 同时请注意，当调用 continue gameLoop 去跳转到下一 次循环迭代时，这里使用 gameLoop 标签并不是严格必须的。因为在这个游戏中，只有一个循环体，所以 continue 语句会影响到哪个循环体是没有歧义的。然而， continue 语句使用 gameLoop 标签也是没有危害的。
//这样做符合标签的使用规则，同时参照旁边的 break gameLoop，能够使游戏的逻辑更加清晰和易于理解。

func greet(_ person: [String: String]){
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return////////
        //枚举//
        ///////
        
    }
    print("I hope the weather is nice in \(location).")
}
greet(["name":"Jone"])
greet(["name":"jone","location":"Cupertino"])

if #available(iOS 10, macOS 10.12, *) {
    // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
} else {
    // 使用先前版本的 iOS 和 macOS 的 API
}

func greetAgain(person:String) -> String{
    return "Hello again " + person
}

print(greetAgain(person: "lucy"))

// _ 忽略参数标签
func someFunction(_ firstParameterName:Int, secondParameterName:Int){
    
}
someFunction(1, secondParameterName: 2);

// 默认参数
func defaultParameterFunction(parameterWithoutDefault:Int,parameterWithDeault:Int = 12){
    //第二个参数默认是12
}

// 可变参数
func arithmeticMean(_ numbers:Double ...) -> Double{
    var total = 0.0
    for number in numbers {
        total += number
    }
    return  total/Double(numbers.count)
}

print(arithmeticMean(1,2,3,4,5))
print(arithmeticMean(1111,2,0))
//一个函数最多只能拥有一个可变参数

//输入输出函数
func swapTwoInts(_ a:inout Int, _ b:inout Int){
    let temp = a;
    a = b;
    b = temp;
}

//函数类型作为返回类型
func stepForward(_ input:Int) -> Int{
    return input + 1
}

func stepBackward(_ input:Int) -> Int{
    return input - 1
}

func chooseStepFunction(backward:Bool) -> ((Int) -> Int){
    return  backward ? stepBackward : stepForward
}

//嵌套函数
func chooseStepFunctionNested(backward:Bool) -> ((Int) -> Int){
    func stepBackward(input: Int) -> Int {return input + 1}
    func stepForward(input: Int) -> Int {return input - 1}
    return  backward ? stepBackward : stepForward
}

////////////////////// 8月10日 ///////////////////////////////

////////
//闭包//
///////

//sorted 方法
let names = ["Chris","Alex","Ewa","Barry","Daniella"];
func backward(_ s1:String, _ s2:String) -> Bool{
    return s1 > s2
}

var reversedNames = names.sorted(by:backward)
print(reversedNames)

//闭包表达式语法
reversedNames = names.sorted(by: { (s1:String, s2:String) -> Bool in return s1 > s2 })
//上下文类型推断
reversedNames = names.sorted(by: { s1,s2 in return s1 > s2 })
//闭包隐式返回
reversedNames = names.sorted(by: { s1,s2 in s1 > s2 })
//参数名称缩写
reversedNames = names.sorted(by: { $0 > $1 })
//运算符方法
reversedNames = names.sorted(by: >)
//尾随闭包
reversedNames = names.sorted() { $0 > $1 }
reversedNames = names.sorted{ $0 > $1 }

let digitNames = [
    0:"zero",1:"one",2:"two",3:"three",4:"four",
    5:"five",6:"six",7:"seven",8:"eight",9:"nine",
]
let numbers = [16,58,250]

let strings = numbers.map{
    (number) -> String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number % 10]! + output //！强制解包表明字典中有明确值
        number /= 10
    }while number > 0
    return output
}
print(strings)

//值补获
func makeIncrementer(forIncrement amount:Int) -> (() -> Int){
    var runningTotal = 0
    func incrementer() -> Int{
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())

//闭包是引用类型
let alsoIncrementByTen = incrementByTen
print(incrementByTen())

//逃逸闭包
var completionHandlers:[() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler:(@escaping () -> Void)){
    completionHandlers.append(completionHandler)
}
//一种能使闭包“逃逸”出函数的方法是，将这个闭包保存在一个函数外部定义的变量中。举个例子，很多启动异步操作的函数接受一个闭包参数作为completion handler。
//这类函数会在异步操作开始之后立刻返回，但是闭包直到异步操作结束后才会被调用。在这种情况下，闭包需要“逃逸”出函数，因为闭包需要在函数返回之后被调用

func someFunctionWithNonescapingClosure(closure:(() -> Void)){
    closure();
}

class SomeClass{
    var x = 10
    func dosomething(){
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
}

//传递到 someFunctionWithEscapingClosure(_:) 中的闭包是一个逃逸闭包，这意味着它需要显式地引用 self
//相对的，传递到 someFunctionWithNonescapingClosure(_:) 中的闭包是一个非逃逸闭包，这意味着它可以隐式引用self


//自动闭包
var customersInLine = ["Chris","Alex","Ewa","Barry","Daniella"]
print(customersInLine.count)

let customerProvide = { customersInLine.remove(at: 0) }
print(customersInLine.count)
print("Now serving \(customerProvide())")
print(customersInLine.count)

func serve(customer customerProvider:(@autoclosure () -> String)){
    print("Now serving \(customerProvide())")
}
serve(customer: customersInLine.remove(at: 0))
//它并没有接受一个显式的闭包，而是通过将参数标记为 @autoclosure 来接收一个自动闭包。
//现在你可以将该函数当作接受 String 类型参数(而非闭包)的函数来调用
























