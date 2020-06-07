//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//华氏的
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

//摄氏的
struct Celsius {
    var temperature: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperature = (fahrenheit - 32.0) / 1.8
    }
    //开氏绝对温标
    init(fromKelvin kelvin: Double) {
        temperature = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperature = celsius
    }
}

//参数的内部名称和外部名称

//外部参数
struct Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
    
}

class SurveyQuestion {
    var text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
    
//    //常量属性
//    let instanceText: String
//    init(instanceText: String) {
//        self.instanceText = instanceText
//    }
    
// 对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改，不能在子类中修改
    

}

//默认构造器
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
    
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let oX = center.x - (size.width / 2)
        let oY = center.y - (size.height / 2)
        self.init(origin: Point(x: oX, y:oY), size: size)
    }
}

///
/////////
///

enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}


enum TemperatureUnit0: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}
//此例与上例相仿


///必要构造器
class RequiredInitClass {
    required init() {}
//    在类的构造器前添加 required 修饰符表明所有该类的子类都必须实现该构造器
}


class SomeClass {
    let someProperty: String  = {
        return ""
    }()
}

//注意闭包结尾的大括号后面接了一对空的小括号。这用来告诉 Swift 立即执行此闭包。
//如果你忽略了这对括号，相当于将闭包本身作为值赋值给了属性，而不是将闭包的返回值赋值给属性。


//如果你使用闭包来初始化属性，请记住在闭包执行时，实例的其它部分都还没有初始化。
//这意味着你不能在闭包里访问其它属性，即使这些属性有默认值。
//同样，你也不能使用隐式的 self 属性，或者调用任何实例方法。


































