//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//引用计数仅仅应用于类的实例。结构体和枚举类型是值类型，不是引用类型，也不是通过引用的方式存储和传递。

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: Person?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

class Person {
    let name: String
    var apartment: Apartment?
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

//弱引用和无主引用
//weak let nameweak: String
//unowned let nameunowned: String

//闭包捕获列表
class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: (Void) -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text) </\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

//在闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为 无主引用 。
//相反的，在被捕获的引用可能会变为 nil 时，将闭包内的捕获定义为 弱引用 。弱引用总是可选类型，并且当引用 的实例被销毁后，弱引用的值会自动置为 nil 。这使我们可以在闭包体内检查它们是否存在。
//注意
//如果被捕获的引用绝对不会变为 nil ，应该用无主引用，而不是弱引用。

enum VendingMachineError: Error {
    case invalidSelection   //选择无效
    case insufficientFunds(coinsNeeded: Int)    //金额不足
    case outOfStock     //缺货
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11),
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) -> Void {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws -> Void {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: (item.price - coinsDeposited))
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}














