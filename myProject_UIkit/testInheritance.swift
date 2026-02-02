//
//  testInheritance.swift
//  myProject_UIkit
//
//  Created by Sanyukta Adhate on 12/01/26.
//

    //parent class
class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {
        "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
            // empty
    }
}
    //child class
class Bicycle: Vehicle {
    var hasBasket = false
}
    //child class
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
    //child class
class Car: Vehicle {
    var gear = 1
    
    override var description: String {
        super.description + " in gear \(gear)"
    }
}
func testInheritance(){
    let bike = Bicycle()
    bike.hasBasket = true
    bike.currentSpeed = 15
    print(bike.description)
    let t = Train()
    t.makeNoise()
    let c = Car()
    print(c.description)
}
