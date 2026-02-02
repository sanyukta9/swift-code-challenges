//
//  Dictionaries.swift
//  myProject_UIkit
//
//  Created by Sanyukta Adhate on 12/01/26.
//
struct Dictionaries {
    static func doom(){
        
            //empty dictionary
        var namesOfIntegers: [Int: String] = [:]
        print(namesOfIntegers)
        
            //with single value
        let namesOfIntegers1: [Int: String] = [19: "nineteen"]
        print(namesOfIntegers1)
        
            //we know type already
            //subscript syntax
        namesOfIntegers[16] = "sixteen"
        print(namesOfIntegers)
        
            //empty dictionary of type [Int: String]
        namesOfIntegers = [:]
        print(namesOfIntegers)
        
            //with multiple values
        var airports: [String: String] = [ "MUM": "Mumbai","DUB": "Dublin"]
        print(airports)
        
            //type inference
        var airports1 = [ "MUM": "Mumbai","DUB": "Dublin"]
        print(airports1)
        
            //count n isEmpty
        print(airports.count)
        if namesOfIntegers.isEmpty{
            print("Empty")
        }
        
            //add, remove
            //add
        airports1["LHR"] = "London"
        print(airports1)
            //update- subscript syntax
        airports1["LHR"] = "London Heathrow"
        print(airports1)
            //update- updatevalue
        if let old = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print(old)
        }
        print(airports)
            //check for keys
        if let name = airports["DUB"] {
            print(name)
        }
        if let name = airports["GUJ"] {
            print(name)
        }
            //remove
        airports["MUM"] = nil
        print(airports)
        
        airports.removeValue(forKey: "DUB")
        print(airports)
        
            //Iterating over a dictionary
        let fruits: [String: Int] = ["apple": 5, "banana": 3, "cherry": 2]
        
            //key+value
        for (fruit, count) in fruits {
            print(fruit, count)
        }
            //keys
        for fruit in fruits.keys {
            print(fruit)
        }
            //values
        for count in fruits.values {
            print(count)
        }
        
            //Converting to Arrays
        let a = Array(fruits.keys)
        print(a)
        let b = Array(fruits.values)
        print(b)
        
            //Sorted Iteration
        for fruit in fruits.keys.sorted() {
            print(fruit)
        }
        for fruit in fruits.values.sorted() {
            print(fruit)
        }
        
        
            //-----------------------------------------------------//
            //for loop
        let a1 = [1,2,3,4]
        for num in a1{
            print(num)
        }
        for i in stride(from: 0, to: 30, by: 5) {
            print(i)
        }
        for i in stride(from: 0, through: 30, by: 5) {
            print(i)
        }
            //if as an expression
        let temp = -2
        let advice = if temp <= 0 {
            "Cold"
        } else {
            "Normal"
        }
        print(advice)
            //switch
        let value = 3
        switch value {
            case 1:
                print("One")
            case 2, 3:
                print("Two or Three")
            default:
                print("Other")
        }
        
            //-----------------------------------------------------//
            //interval matching
        let number = 7
        
        switch number {
            case 1..<5:
                print("Between 1 and 4")
            case 5..<10:
                print("Between 5 and 9")
            default:
                print("Out of range")
        }
        
            //tuple matching
        let point = (0, 5)
        
        switch point {
            case (0, 0):
                print("Origin")
            case (_, 0):
                print("On X-axis")
            case (0, _):
                print("On Y-axis")
            default:
                print("Somewhere else")
        }
        
            //wildcard _
        let value1 = 10
        switch value1 {
            case _:
                print("Works for any value")
        }
        
            //value binding
        let point1 = (3, 4)
        switch point1 {
            case let (x, y):
                print("x =", x, "y =", y)
        }
        
            //Where Clause (Extra condition)
        let point2 = (5, 5)
        switch point2 {
            case let (x, y) where x == y:
                print("x and y same hain")
            default:
                print("Different values")
        }
        
            //compound cases
        let letter = "a"
        switch letter {
            case "a", "e", "i", "o", "u":
                print("Vowel")
            default:
                print("Consonant")
        }
        
            //pattern matching - if case - switch shorter version
        let point3 = (8, 0)
        if case (let x, 0) = point3 {
            print("x-axis par hai, x =", x)
        }
        
            //Pattern Matching – for case in
        let points = [(1, 0), (2, 3), (4, 0), (5, 6)]
        for case (let x, 0) in points {
            print("x-axis point:", x)
        }
        
            //-----------------------------------------------------//
            //continue
        let letters = ["a", "b", "c", "d"]
        for ch in letters {
            if ch == "b" {
                continue
            }
            print(ch)
        }
            //break
        for i in 1...5 {
            if i == 3 {
                break
            }
            print(i)
        }
        let num = 2
        switch num {
            case 1:
                print("One")
            case 2:
                print("Two")
                break
            default:
                print("Other")
        }
            //fallthrough(rare)
        let numb = 1
        switch numb {
            case 1:
                print("One")
                fallthrough
            case 2:
                print("Two")
            default:
                print("Other")
        }
            //return
        func greet(name: String) {
            if name.isEmpty {
                return
            }
            print("Hello \(name)")
        }
        greet(name: "")
            //throw
        enum LoginError: Error {
            case invalidPassword
        }
        
        func login(password: String) throws {
            if password != "1234" {
                throw LoginError.invalidPassword
            }
        }
        do {
            try login(password: "san")
        }
        catch{
            print("wrong password")
        }
        
            //labeled
        outerLoop: for i in 1...3 {
            for j in 1...3 {
                if i == 2 && j == 2 {
                    break outerLoop
                }
                print(i, j)
            }
        }
            //guard
        func greet(person: [String: String]) {
            guard let name = person["name"] else {
                return
            }
            print("Hello \(name)")
        }
        greet(person: ["name": "Sanyukta"])
        
            //defer
        func testDefer() {
            defer { print("1") }
            defer { print("2") }
        }
        testDefer()
        
            //defer with return
        func work() {
            defer { print("Cleanup") }
            print("Working")
            return
        }
        work()
        
            //API avaliabilty
            //if form
        if #available(iOS 16, *) {
            print("iOS 16 feature")
        } else {
            print("Old iOS")
        }
            //guard form
        func useNewAPI() {
            guard #available(iOS 16, *) else {
                return
            }
            print("Using iOS 16 API")
        }
        useNewAPI()
    }
}


