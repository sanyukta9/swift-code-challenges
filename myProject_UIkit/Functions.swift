//
//  Functions.swift
//  myProject_UIkit
//
//  Created by Sanyukta Adhate on 12/01/26.
//
//function
struct Functions {
    static func boom(){
        //simple function
        func simpleFunction() {
            print("Hello Sanyukta")
        }
        simpleFunction()
        
        //Fn with Parameter
        func simpleFunc(name: String) {
            print(name)
        }
        simpleFunc(name: "Sanyukta")
        
            //Fn without parameter but return type String
        func sayHello() -> String {
            "Hello World"
        }
        print(sayHello())
        
            //Fn with parameter but return type Void
        func greet1(person: String) {
            print("Hello \(person)")
        }
        greet1(person: "Anna")
        
            //Multiple Return Values (Tuple)
        func minMax(array: [Int]) -> (min: Int, max: Int) {
            (array.min()!, array.max()!)
        }
        let result = minMax(array: [1, 5, 2])
        print(result.min)
        print(result.max)
        
            //Optional Tuple Return
        func minMax1(array: [Int]) -> (min: Int, max: Int)? {
            if array.isEmpty { return nil }
            return (array.min()!, array.max()!)
        }
        
        let result1 = minMax1(array: [])
        print(result1?.min)
        print(result1?.max)
        
            //Implicit Return (Single Expression)
        func greet(person: String) -> String {
            "Hello \(person)"
        }
        let ans = greet(person: "Joey")
        print(ans)
        
            //Argument Labels vs Parameter Names
        func greet(name: String, city: String) {
            print(name, city)
        }
        greet(name: "Bill", city: "Pune")
        
            //Omitting Argument Labels
        func add(_ a: Int, _ b: Int) -> Int {
            a + b
        }
        print(add(2, 3))
        
            //Default Parameter Values
        func greet(name: String, emoji: String = "🙂") {
            print(name, emoji)
        }
        
        greet(name: "Sam")
        greet(name: "Sam", emoji: "👋")
        
            //Variadic Parameters (...)
        func average(_ numbers: Double...) -> Double {
            numbers.reduce(0, +) / Double(numbers.count)
        }
        print(average(1, 2, 3, 4))
        
            //In-Out Parameters (inout)
        func swapValues(_ a: inout Int, _ b: inout Int) {
            (a, b) = (b, a)
        }
        var x = 5
        var y = 10
        swapValues(&x, &y)
        
            //Functions as Variables
        func add1(_ a: Int, _ b: Int) -> Int {
            a + b
        }
        let operation: (Int, Int) -> Int = add
        print(operation(2, 3))
        
            //Functions as Parameters
        func apply(_ f: (Int, Int) -> Int, _ a: Int, _ b: Int) {
            print(f(a, b))
        }
        
        print(apply(add, 3, 5))
        
            //Functions as Return Tymm pes
        func chooseStep(backward: Bool) -> (Int) -> Int {
            backward ? { $0 - 1 } : { $0 + 1 }
        }
        let step = chooseStep(backward: true)
        print(step(5))
        
            //Nested Functions
        func outer() {
            func inner() {
                print("Inside")
            }
            inner()
        }
        
        
        let _ = fName()
        func fName() -> Void{
            print("Hii world")
        }
        
    }
}

