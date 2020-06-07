//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//类型方法
class SomeClass {
    var user = 1.0
    
    class func someTypeMethod() {
//        self.user = 2.0
    }
    
    static func method(){
        
    }
}
SomeClass.someTypeMethod()
SomeClass.method()


//下标操作
class SubClass{
    
    subscript(index:Int) -> Int{
        get{
            //返回一个适当的Int类型的值
            return index
        }
        set(newValue){
            //执行适当的赋值操作
        }
    }
}

struct TimesTable {
    let multiplier:Int
    subscript(index:Int) -> Int {
        return multiplier * index
    }
    
}

struct Matrix {
    
    let rows:Int, columns:Int
    var grid:[Double]
    
    init(rows:Int, columns:Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row: row, column: column),"index out of range")
            return grid[row * columns + column]
        }
        set(newValue) {
            assert(indexIsValidForRow(row: row, column: column),"index out of range")
            grid[row * columns + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0,1] = 1.5
matrix[1,0] = 3.2
print(matrix.grid)
//matrix[2,2]

//继承
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() -> Void {
        
    }
}

let someVehicle = Vehicle()
print("\(someVehicle.description)")

class Bicycle: Vehicle {
    var hasBasket = false
    
}

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

//重写
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
print(car.description)

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
            print("automatic currentSpeed did set")
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("\(automatic.description)")























