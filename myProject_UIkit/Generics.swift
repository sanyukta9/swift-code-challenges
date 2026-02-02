//
//  Generics.swift
//  myProject_UIkit
//
//  Created by Sanyukta Adhate on 13/01/26.
//

//1.
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}
//2.
func identity<T>(_ value: T) -> T {
    return value
}
//3.Custom generic type

//Stack is a generic DS. Element is a placeholder type. This stack can store any type, but only one type at a time.
struct Stack<Element> {
    var items: [Element] = [] //items is an empty array. It stores elements of type Element.
    
    //mutating? Stack is a struct (value type). Changing items means changing self. LIFO structure. A new item comes in.
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        items.isEmpty ? nil : items.removeLast()
    }
    
    func peek() -> Element? {
        items.last
    }
}
//4.Extending a generic type
//struct Stack<Element>{
//    //code
//}
//Element is a generic type parameter. It’s defined once, at the type level.
//What does “Extending a Generic Type” mean? You want to add new functionality to Stack w/o rewriting the struct and knowing what Element actually is.
//extension Stack<Element> { } // ❌
//Why? Stack already has a generic param. Swift automatically makes Element available inside the extension. — just reuse it.
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
//You don’t redeclare generics in extensions — you reuse them.
//It applies to: Any generic struct,class,enum. As long as: Generic parameter is defined in the original type and Extension reuses it.
struct Box<T> {
    var value: T
}

extension Box {
    func describe() {
        print("Box contains:", value)
    }
}
//5.Extensions with CONDITIONS (where clause)
//Conditional Conformance: This method exists ONLY IF: Element conforms to Equatable. WHY topItem == item
//Stack<CustomTypeWithoutEquatable> → method DOES NOT exist

extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        topItem == item
    }
}
//6.Type Constraints (T: Protocol)
func areSame<T: Equatable>(_ a: T, _ b: T) -> Bool {
    return a == b
}
struct Userz: Equatable {
    let id: Int
}

struct Generics{
    static func dhoom(){
        //1.
        var x = 10
        var y = 20
        swapTwoValues(&x, &y)   
        print(x,y)
        
        var a = "Hello"
        var b = "World"
        swapTwoValues(&a, &b)
        print(a,b)
        
        //2.
        print(identity(5))        // T = Int
        print(identity("Hello"))  // T = String
        print(identity(10.4))     // T = Double
        
        //3.
        var s1 = Stack<Int>()
        var s2 = Stack<String>()
        var s3 = Stack<Double>()
        s1.push(10)
        s1.push(20)
        s1.push(30)
        s2.push("A")
        s2.push("B")
        s2.push("C")
        s3.push(10.1)
        
        print(s1.pop()!)
        print(s1.peek()!)
        print(s2.pop()!)
        print(s2.peek()!)
        print(s3.peek()!)
        
        //4.
        var stackOfStrings = Stack<String>()
        stackOfStrings.items = ["uno", "dos", "tres"]
        
        if let topItem = stackOfStrings.topItem {
            print("Top item:", topItem)
        }
        
        var stackOfInts = Stack<Int>()
        stackOfInts.items = [1, 2, 3]
        print(stackOfInts.topItem!)
        
        Box(value: 10).describe()
        Box(value: "Hello").describe()
        
        //5.
        var s = Stack<Int>()
        s.items = [1, 2, 3]
        print(s.isTop(3))
        
        //6.
        print(areSame(10, 10))
        print(areSame(10, 20))
        
        print(areSame("Swift", "Swift"))
        print(areSame("Swift", "iOS"))
        
        let u1 = User(id: 1)
        let u2 = User(id: 1)
        print(areSame(u1, u2))
    }
}
