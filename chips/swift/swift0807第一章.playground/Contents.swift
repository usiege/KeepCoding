//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let addStr = 60
let implicitInteger = 70
let widthLabel = implicitInteger

let strRes = str + String(addStr)

print("i have \(addStr) apples!")

let emptyArray = [String]()
let emptyDictionary = [String: Float]()

var shoppingList = ["a","b","c"]
var occupations = ["A":"a","B":"b","C":"c"]

shoppingList = [];
occupations = [:];

////////////////////////////////////

let individualScores = [75,43,100,737,111]
var teamScore = 0
for score in individualScores{
    if score > 50 {
        teamScore += 30
    }else{
        teamScore -= 1
    }
}
print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

print(greeting)

//默认情况下，函数使用它们的参数名称作为它们参数的标签，在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签。
func greet(you person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(you:"John", on:"Wednesday")

func greetHave_(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greetHave_("John", on:"Wednesday")

func sumOf(_ numbers:Int ...) -> Int{
    var sum = 0;
    for number in numbers {
        sum += number
    }
    return sum
}

sumOf(45,67,88)

//你可以使用 {} 来创建 一个匿名闭包。使用 in 将参数和返回值类型声明与闭包函数体进行分离。
var numbers = [12,66,01]
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

({
    (number:Int) -> Int? in
    if number % 2 == 1{
        return 0
    }else{
        return nil
    }
})


//当一个闭包作为最后一个参数传给一个函数的时候，它可以直接跟在括号后面。
//当一个闭包是传给函数的唯一参数，你可以完全忽略括号。
let sortedNumbers = numbers.sorted(by:{ $0 > $1 })
print(sortedNumbers)


//如果 ? 之前的值是 nil ， ? 后面 的东西都会被忽略，并且整个表达式返回 nil 。
//否则， ? 之后的东西都会被运行。在这两种情况下，整个表达式 的值也是一个可选值。
class Square{
    var sideLength:Float
    init(sideLength:Float,name:String) {
        self.sideLength = sideLength
    }
}

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength









