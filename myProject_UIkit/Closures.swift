//
//  Closures.swift
//  myProject_UIkit
//
//  Created by Sanyukta Adhate on 12/01/26.
//
struct Closures {
    static func chalo(){
        
            //Function
        func demo() -> String{
            return "Helloo"
        }
        print(demo())
        
        func demo1() -> Void{
            print("Helooooo snake")
        }
        print(demo1())
            //y does it return two values i.e. Helooooo snake, ()
        
        
        func greet(name: String) -> String{
            "Hello, \(name)"
        }
        let greet = greet(name: "Sanyukta")
        print(greet)
        
            //closures
        let greet1 = { (name: String) in
            print("Hii, \(name)")
        }
        greet1("Sanyukta")
        
            //1
            //---Example
            //Function
        func add2(a: Int, b: Int) -> Void{
            print(a+b)
        }
        add2(a: 20, b: 30)
        
        func add3(_ a: Int, _ b: Int) -> Void{
            print(a+b)
        }
        add3(20, 30)
        
            //Closure
            //Separate declaration and assignment
        var add: (_ a: Int, _ b: Int) -> (Void) // variable closure declaration
        add = { (a: Int, b: Int) in
            print(a + b)
        }
        add(30,20)
        
        var sub: (_ c: Int, _ d: Int) -> (Void)
        sub = { (c: Int, d: Int) in
            print(c - d)
        }
        sub(50,20)
        
            // combined assignment and declaration
        var add1: (_ a: Int, _ b: Int) -> (Void) = { (a: Int, b: Int) in // (a,b)
            print(a + b)
        }
        add1(30,20)
        
        var sub1: (_ c: Int, _ d: Int) -> (Void) = { (c: Int, d: Int) in // (c,d)
            print(c - d)
        }
        sub1(50,20)
        
        
            //function
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        func backward(a: String, b: String) -> Bool {
            a > b
        }
        print(names.sorted(by: backward))
            //closure
        let closure = names.sorted(by: { (a: String, b: String) -> Bool in
            a > b
        })
        print(closure)
        
        let demo: (_ a: String, _ b: String) -> Bool = { (a: String, b: String) -> Bool in
            a > b
        }
        print(closure)
        
        
            //Example: 2
        class Something {
            var num1: Int = 20
            var num2: Int = 30
            
            func result(closure: () -> (Void)) {
                closure()
            }
            
            func printResult() {
                result { [num1] in
                    self.num1 = 10
                    print(num1 + num2)
                }
            }
        }
        
        let some = Something()
        some.printResult()
        
        let numbers = [1, 2, 3]
        let strings = numbers.map { number in
            "\(number)"
        }
        print(strings)
        
            //Closures can REMEMBER values
        func createWallet() -> (Int) -> Int {
            var balance = 0
            
            return { amount in
                balance += amount
                return balance
            }
        }
        let myWallet = createWallet()
        print(myWallet(10))
        print(myWallet(20))
        print(myWallet(30))
        print(myWallet(40))
        let sameMyWallet = myWallet //closure captures by reference
        print(sameMyWallet(50))
        
            //concept
            //function
        func test() -> Void {
            var x = 10
            x += 1
            print("x inside normalFunction =", x)
        }
        print(test())
        print(test())
        print(test())
            //closure
        func test1() -> () -> Void {
            var x1 = 20
            return {
                x1 += 1
                print("x1 inside closure =", x1)
            }
        }
        let result = test1()
        print(result())
        print(result())
        print(result())
        
            //trailing closure
            //fucntion which is taking closure as a parameter
        func performOperation(operation: () -> Void) {
            print("Before operation")
            operation()
            print("After operation")
        }
        /*
         performOperation(operation: {
         print("Doing some work")
         })
         */
            //now trailing closure
        performOperation {
            print("Doing some work")
        }
        
        
            //When parentheses can be REMOVED completely- If the function has only one parameter and that parameter is a closure:
        func execute(task: () -> Void) {
            task()
        }
        execute {
            print("Running task")
        }
            //Multiple parameters + closure
        func download(file: String, completion: () -> Void) {
            print("Downloading \(file)")
            completion()
        }
        download(file: "data.json") {
            print("Download complete")
        }
        
            //forEach
        let numbers1 = [1, 2, 3]
        numbers1.forEach { num in
            print(num)
        }
        
            //non escaping
        class Person {
            var name = "Sanyukta"
            
            func sayName(action: () -> Void) {
                action()
            }
            
            func test() {
                sayName {
                    print(name)   // self optional
                }
            }
        }
        let person = Person()
        print(person.test())
            //self: Escaping closure
        class Person1 {
            var name = "Sanyukta"
            var storedAction: (() -> Void)?
            
            func sayName(action: @escaping () -> Void) {
                storedAction = action   // stored for later
            }
            
            func test() {
                sayName {
                    print(self.name)   // self REQUIRED
                }
            }
        }
        let persons = Person1()
        print(persons.test())
        print(persons.storedAction?())
        
            //Autoclosures
        var customers = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        let provider = { customers.removeFirst() }
        print(provider()) //runs closure cuz we call it
        
            //Runs only inside serve - execution delayed
        func serve(_ customer: @autoclosure () -> String) {
            print("Serving \(customer())")
        }
            // let provider = { customers.removeFirst() }
            //print(provider())
        print(serve(customers.removeFirst()))
        
            //autoclosure + escaping
        var tasks: [() -> String] = []
        func collect(_ task: @autoclosure @escaping () -> String) {
            tasks.append(task)
        }
        print(collect(customers.removeFirst()))
        print(collect(customers.removeFirst()))
        for task in tasks {
            print(task())
        }
        
            //---------------------------------- ENUMS ------------------
        
            // MARK: - Basic Enum + Switch
        enum CompassPoint {
            case north, south, east, west
        }
        
        let direction1: CompassPoint = .south
        print(direction1)
        
        switch direction1 {
            case .north:
                print("Up")
            case .south:
                print("Down")
            case .east:
                print("Right")
            case .west:
                print("Left")
        }
        
            // MARK: - Enum Variable Reassignment
        var direction = CompassPoint.west
        print(direction)
        
        direction = .east
        print(direction)
        
            // MARK: - Enum Iteration
        enum Beverage: CaseIterable {
            case coffee, tea, juice
        }
        
        for drink in Beverage.allCases {
            print(drink)
        }
        
            // MARK: - Associated Values
        enum Barcode {
            case upc(Int, Int, Int, Int)
            case qrCode(String)
        }
        
        var code = Barcode.upc(8, 85909, 51226, 3)
        
        switch code {
            case let .upc(system, manufacturer, product, check):
                print(system, manufacturer, product, check)
            case let .qrCode(text):
                print(text)
        }
        
        code = .qrCode("ABCDEFG")
        print(code)
        
            // MARK: - if case (Pattern Matching)
        if case let .qrCode(value) = code {
            print(value)
        }
        
            // MARK: - Raw Values (String)
        enum Compasses: String {
            case north, south, east, west
        }
        
        print(Compasses.west.rawValue)
        
            // MARK: - Raw Values (Int)
        enum Planet: Int {
            case mercury = 1, venus, earth, mars
        }
        
        print(Planet.earth.rawValue)
        
            // MARK: - Initializing from Raw Value
        if let planet = Planet(rawValue: 3) {
            print(planet)
        } else {
            print("Invalid planet")
        }
        
            // MARK: - Recursive Enums
        indirect enum Expression {
            case number(Int)
            case add(Expression, Expression)
            case multiply(Expression, Expression)
        }
        
        func evaluate(_ exp: Expression) -> Int {
            switch exp {
                case let .number(value):
                    return value
                case let .add(a, b):
                    return evaluate(a) + evaluate(b)
                case let .multiply(a, b):
                    return evaluate(a) * evaluate(b)
            }
        }
        
            // Represents: 2 + (3 * 4)
        let expression = Expression.add(
            .number(2),
            .multiply(.number(3), .number(4))
        )
        
        let op = evaluate(expression)
        print(op)
    }
}

