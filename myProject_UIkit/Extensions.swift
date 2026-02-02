//
//  Extensions.swift
//  myProject_UIkit
//
//  Created by Sanyukta Adhate on 12/01/26.
//

    //1. add computed properties
extension Int {
        // 2. Extensions must not contain stored properties: var storedValue = 5
    var isEven: Bool {
        return self % 2 == 0
    }
}
    //3. adding Instance Methods
extension String {
    func reversedString() -> String {
        return String(self.reversed())
    }
}
    //4. adding Mutating Methods
extension Int {
    mutating func square() -> Void {
        self = self * self
    }
}
    // I removed mutating and changed the name to squared() because it's no longer modifying the original value
    // - it's just returning a new value.
extension Int {
    func squared() -> Int {
        return self * self
    }
}
    //5. adding Static Methods and Properties
extension Int {
    static func randomEven() -> Int {
        return Int.random(in: 0...100) * 2
    }
}
    //6. adding Initializers
    //struct
struct Person {
    var name: String
}
extension Person {
    init() {
        self.name = "Unknown"
    }
}
    // class - check MyPlayground
    //7. add subscript
extension String {
    subscript(index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
    //8. Nested Types
extension String {
    enum ValidationResult {
        case valid
        case invalid
    }
    
    func validate() -> ValidationResult {
        return self.isEmpty ? .invalid : .valid
    }
}
struct Extensions {
    static func work(){
        let num1 = 10
        let num2 = 11
        print(num1.isEven)
        print(num2.isEven)
        
        let text = "Swift"
        print(text.reversedString())
        
        var val1 = 4
            // print(val1.square()) - returns void ()
        val1.square()
        print(val1)
        
        var val2 = 4
        print(val2.squared())
        
        print(Int.randomEven())
        
        let person1 = Person()
        print(person1.name)
        
        let person2 = Person(name: "Sanyukta")
        print(person2.name)
        
        let word = "Swift"
        print(word[1])
        
        print("Hello".validate())
        
    }
}
