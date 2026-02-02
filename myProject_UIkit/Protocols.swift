//
//  Protocols.swift
//  myProject_UIkit
//
//  Created by Sanyukta Adhate on 12/01/26.
//
import Foundation

protocol FullyNamed {
    var fullName: String { get }
}
//1. struct
//Man promises to follow the FullyNamed contract
struct Man: FullyNamed {
    var fullName: String //satisfies protocol -> creates initializer: Man(fullName: String)
    static var count = 10
}
////2. class
class Woman: FullyNamed {
    var prefix: String? // Can be "Ms", "Mrs", or nil
    var name: String
    
    class var count: Int { 20 }
    static var counter: Int { 40 }
    
//prefix has a default value (nil) - self Assigns the incoming parameters to the class properties
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
//computed property
    var fullName: String {
        (prefix ?? "Miss") + " " + name
    }
}
//subclass
class Actress: Woman {
    override class var count: Int { 30 }
}
//3. method
//Swift forces TV,AC to implement turnOn()
protocol RemoteControllable {
    func turnOn()
}
class TV: RemoteControllable {
    func turnOn() {
        print("TV is now ON")
    }
}
class AC: RemoteControllable {
    func turnOn() {
        print("AC is now ON")
    }
}
//4. mutating method: Classes do not need mutating
protocol Togglable {
    mutating func toggle()
}
enum Switch: Togglable {
    case on, off
    
    mutating func toggle() {
        self = (self == .on) ? .off : .on
    }
}
//5. Initializer Requirements
//Rule: Any account must be created with an ID. If data is wrong then account creation fails
protocol AccountCreatable {
    init(id: Int)          // normal initializer
    init?(data: String)    // failable initializer
}
//base class has init
class BaseAccount {
    init() {
        print("Base account setup")
    }
}
//child class - base class, protocol
class UserAccount: BaseAccount, AccountCreatable {
    var id: Int
//    // REQUIRED because protocol demands it - Every subclass MUST implement this initializer.
//    //struct doesn’t need required as it doesnt support inheritence
    required init(id: Int) {
        self.id = id
        super.init() //call when parent already has init - If parent already defines init(), subclass must call it.
        print("UserAccount created with ID:", id)
    }
    
    // FAILABLE initializer (can fail)
    required init?(data: String) {//Object creation can FAIL
        guard let id = Int(data) else {
            print("Invalid data")
            return nil
        }
        self.id = id
        super.init()
        print("UserAccount created from data:", id)
    }
}
//6. Semantic-only protocols + Protocols as Types (Generic / Opaque / Existential)
//Protocols are not just rules — they are labels, contracts, and containers
//Semantic-only protocol (TAG ONLY) - no methods, no properties. Swift uses such protocols for meaning, not behavior.
protocol Fragile {}
//protocol with behavior
protocol Describable {
    var description: String { get }
}
//types
struct GlassBox: Fragile, Describable {
    var description: String { "Glass Box" }
}
struct PlasticBox: Describable {
    var description: String { "Plastic Box" }
}
//1)GENERIC (Caller decides)
func printItem<T: Describable>(_ item: T) {
    print(item.description)
}
//2)OPAQUE (some) – API decides
func makeFragileItem() -> some Describable {
    GlassBox()
}
//7. Delegation - I will do my job, but YOU handle the reaction. Loose coupling, Reusable code, Multiple behaviors
//DeliveryGuy will delegate the responsibility of handling updates
protocol DeliveryUpdateDelegate: AnyObject {
    func foodPickedUp()
    func foodDelivered()
}
//DeliveryGuy does not know who the delegate is, just sends msg
class DeliveryGuy {
    weak var delegate: DeliveryUpdateDelegate?
    
    func deliverFood() {
        print("Picking up food...")
        delegate?.foodPickedUp()
        
        print("Delivering food...")
        delegate?.foodDelivered()
    }
}
//Delegate (handles the updates)
class Customer: DeliveryUpdateDelegate {
    func foodPickedUp() {
        print("Customer: Food is on the way!")
    }
    
    func foodDelivered() {
        print("Customer: Food delivered!")
    }
}
//8. Extension conformance
protocol Labelable {
    var label: String { get }
}
struct Product {
    let name: String
}
extension Product: Labelable {
    var label: String {
        "Product: \(name)"
    }
}
//9. Synthesized Conformance
//Equatable (Compare two things) Can I compare? Swift auto-generates ==
struct Point: Equatable {
    let x: Int
    let y: Int
}
//Hashable (Use as key) Can I store in Set/Dict? Swift auto-generates hash(into:). Used by Set and Dictionary
struct User: Hashable {
    let id: Int
}
//Comparable (Sorting) - low < medium < high. Can I sort? Swift auto-generates <
enum Rank: Comparable, CustomStringConvertible {
    case low
    case medium
    case high
    
    var description: String {
        switch self {
            case .low: return "low"
            case .medium: return "medium"
            case .high: return "high"
        }
    }
}
//10. Protocol inheritance
protocol Readable {
    
    var text: String { get }
}

protocol PrettyReadable: Readable {
    var prettyText: String { get }
}

struct Book: PrettyReadable {
    let text: String
    
    var prettyText: String {
        "\(text)"
    }
}
//11. Protocol Composition (&)
protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Personz: Named, Aged {
    let name: String
    let age: Int
}

func greet(person: Named & Aged) {
    print("Hello \(person.name), age \(person.age)")
}
//12. Checking Protocol Conformance (as?)
protocol HasArea {
    var area: Double { get }
}

struct Square: HasArea {
    let side: Double
    var area: Double { side * side }
}
//13. Optional Protocol Requirements (@objc) - Only classes, requires @objc, import foundation
@objc protocol DataSource {
    @objc optional func increment(by count: Int) -> Int
}

class Countest: DataSource {
    func increment(by count: Int) -> Int {
        count + 1
    }
}
//14. Protocol Extensions (Default Method)
protocol Greetable {
    func greet()
}

extension Greetable {
    func greet() {
        print("Hello!")
    }
}
struct Username: Greetable {}
//15. Constrained Protocol Extensions
extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        allSatisfy { $0 == first }
    }
}

struct Protocols{
    static func watch(){
        let p = Man(fullName: "John Cena")
        print(p.fullName)
        
        let w1 = Woman(name: "Anne", prefix: "Ms")
        print(w1.fullName)
        
        let w2 = Woman(name: "Anne")
        print(w2.fullName)
        
        print(Man.count) //struct: type-level property, not an instance property.
        print(Woman.count) //class: type property
        print(Woman.counter)
        print(Actress.count)
        print(Actress.counter)
        
        let tv = TV()
        tv.turnOn()
        
        let ac = AC()
        ac.turnOn()
        
        let devices: [RemoteControllable] = [TV(), AC()]
        for device in devices {
            print("***")
            device.turnOn()
            print("***")
        }
        
        var s = Switch.off
        s.toggle()
        print(s)
        
        let user1 = UserAccount(id: 101)
        print(user1)
        let user2 = UserAccount(data: "202")
        print(user2)
        let user3 = UserAccount(data: "")
        print(user3)
        
        //1)
        printItem(GlassBox())
        printItem(PlasticBox())
        //2)
        let item = makeFragileItem()
        print(item.description)
        //3)EXISTENTIAL (Protocol as a box)
        let anyItem: Describable = GlassBox()
        print(anyItem.description)
        
        let deliveryGuy = DeliveryGuy()
        let customer = Customer()
        deliveryGuy.delegate = customer
        print(deliveryGuy.deliverFood())
        
        let p1 = Product(name: "Phone")
        print(p1.label)
        
        //equatable
        let p0 = Point(x: 1, y: 2)
        let p2 = Point(x: 1, y: 2)
        let p3 = Point(x: 2, y: 3)
        
        print(p0 == p2)
        print(p0 == p3)
        
        //hashable
        let u1 = User(id: 1)
        let u2 = User(id: 2)
        let u3 = User(id: 1)
        let users: Set<User> = [u1, u2, u3]
        
        print(users.count)
        
        let userNames: [User: String] = [
            User(id: 1): "John",
            User(id: 2): "Jane"
        ]
        
        print(userNames[User(id: 1)]!)
        
        //sorting
        let ranks: [Rank] = [.high, .low, .medium]
        let sortedRanks = ranks.sorted()
        
        print(sortedRanks)
        
        let book = Book(text: "Swift Protocols")
        print(book.text)
        print(book.prettyText)
        
        let pz = Personz(name: "John", age: 30)
        greet(person: pz)
        
        let something: Any = Square(side: 4)
        if let obj = something as? HasArea {
            print("Area:", obj.area)
        }
        
        let dataSource: DataSource? = Countest()
        let result = dataSource?.increment?(by: 5)
        print(result ?? 0)
        
        let user = Username()
        user.greet()
        
        print([1, 1, 1].allEqual())
        print([1, 2, 1].allEqual())
    }
}
