//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//递归枚举
enum ArithmeticExpression{
    case number(Int)
    indirect case addition(ArithmeticExpression,ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression,ArithmeticExpression)
}

//使用indirect关键字表明所有成员都是可递归的
indirect enum ArithmeticExpression2{
    case number(Int)
    case addition(ArithmeticExpression2,ArithmeticExpression2)
    case multiplication(ArithmeticExpression2,ArithmeticExpression2)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression:ArithmeticExpression) -> Int{
    switch expression {
    case let .number(value):
        return value
    case let .addition(left,right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left,right):
        return evaluate(left) * evaluate(right)
    }
}

/////////
////类////
////结构体////
///////////////


struct Resolution{
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String = ""
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print("the width of someResolution is \(someResolution.width)")
print("also is \(someVideoMode.resolution.width)")

let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same Resolution instance")
}


/////
//延迟属性
class DataImporter{
    var fileName = "data.txt"
}

class DataManager{
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("some more data")

struct Point{
    var x = 0.0, y = 0.0
}

struct Size{
    var width = 0.0, height = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    var center:Point{
        get{
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x:centerX,y:centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

////
enum Role{
    case wolf,civilian,foresight,witch,hunter,guarder,none
}

class Poker{
    var role:Role = Role.none       //角色
    var aliveStatus:Bool = false    //死亡状态
    var isGoodPerson:Bool = false   //是否好人
    var number:Int = 0              //号码
    
    var vote:[Int] = [Int]()        //投票情况
    var voted:[Int] = [Int]()       //被投票情况
    

    
}






















