//
//  OptionalsPractice.swift
//  myProject_UIkit
//
//  Created by Sanyukta Adhate on 12/01/26.
//

struct OptionalsPractice {
    
    static func run() {
            // 1️⃣ Normal variable (non-optional)
        let fixedAge: Int = 25
        print(fixedAge)
            // fixedAge = nil ❌ (allowed nahi hai)
        
            // 2️⃣ Optional variable
        var userAge: Int? = nil
            // Abhi value nahi hai, par future me aa sakti hai
        
        print(userAge)   // Output: nil
        
            // 3️⃣ Assign value to optional
        userAge = 23
        print(userAge)   // Output: Optional(23)
        
            // 4️⃣ ❌ Direct use karna allowed nahi
            // print(userAge + 2)   ❌ Error
            // Kyunki Swift sure nahi hai ki value hai ya nil
        
            // 5️⃣ ✅ Safest way: if let (Optional Binding)
        if let age = userAge {
            print("User age is \(age)")
        } else {
            print("Age not available")
        }
        
            // 6️⃣ Optional again becomes nil
        userAge = nil
        
            // 7️⃣ if let fails when value is nil
        if let age = userAge {
            print(age)
        } else {
            print("Age is nil now")   // Ye print hoga
        }
        
            // 8️⃣ Nil-coalescing operator (??)
        let finalAge = userAge ?? 18
            // Agar userAge nil hai → 18 use hoga
        print("Final age is \(finalAge)")
        
            // 9️⃣ Optional with String conversion
        let textNumber = "123"
        let number = Int(textNumber)   // Int? (Optional Int)
        
        if let value = number {
            print("Converted number: \(value)")
        } else {
            print("Conversion failed")
        }
        
            // 1️⃣0️⃣ Force Unwrapping (⚠️ Dangerous)
        let score: Int? = 90
        print(score)   // Safe yahan kyunki value hai
        
        let emptyScore: Int? = nil
            // print(emptyScore!) ❌
        
            // 1️⃣1️⃣ Optional Chaining
        class Person {
            var name: String?
        }
        
        let person: Person? = Person()
        person?.name = "Sanyukta"
        
        print(person?.name)   // Optional("Sanyukta")
        print(person?.name ?? "No Name")
        
            // 1️⃣2️⃣ Guard let (mostly used in functions)
        func printAge(_ age: Int?) {
            guard let validAge = age else {
                print("Age is missing")
                return
            }
            print("Age is \(validAge)")
        }
        
        printAge(userAge)     // Age is missing
        printAge(21)          // Age is 21
        
            // ===============================
            // 🔹 OPTIONAL CHAINING (Address/User)
            // ===============================
        
        class Address {
            var city: String?
        }
        
        class User {
            var address: Address?
        }
        
        let user: User? = User()
        
        user?.address = Address()
        user?.address?.city = "Mumbai"
        
        print(user?.address?.city)
        print(user?.address?.city ?? "No City")
        
            // ===============================
            // 🔹 GUARD LET LOGIN EXAMPLE
            // ===============================
        
        func login(username: String?) {
            guard let name = username else {
                print("Username is required")
                return
            }
            print("Welcome, \(name)")
        }
        
        login(username: nil)
        login(username: "Sanyukta")
        
            //Error Handling
            // 1️⃣ Error define
        enum LoginError: Error {
            case invalidUsername
        }
        
            // 2️⃣ Function that can fail
        func login1(username: String?) throws {
            
            if username == nil {
                throw LoginError.invalidUsername
            }
            
            print("Login successful")
        }
        
            // 3️⃣ Using do-try-catch
        do {
            try login1(username: nil)
        } catch {
            print("Login failed")
        }
        
        /**
         //Precondition
         var index = -1
         if index >= 0 {
         print("Valid index")
         } else {
         preconditionFailure("Index negative nahi ho sakti") //fatal error
         }
         
         index = -1
         precondition(index >= 0, "Index negative nahi ho sakta") //Precondition failed
         
         //Assertion
         var age = -3
         if age >= 0 {
         print("Valid age")
         } else {
         assertionFailure("Age negative nahi ho sakti") //fatal error
         }
         
         age = -3
         assert(age >= 0, "Age negative nahi ho sakti") //assertion failed
         **/
        
            //Strings and characters
        let quote = """
Stay hungry.
Stay foolish.
"""
        print(quote)
        let text = """
This is line one \
and still the same line.
"""
        print(text)
        
        func change(_ value: String) -> String {
            var temp = value
            temp += "!"
            return temp
        }
        let original = "Hi"; print(change(original))
        
            //String indexing
        let text1 = "Swift"
        let firstChar = text1[text1.startIndex]
        print(firstChar)
        let lastChar = text1[text1.index(before: text1.endIndex)]
        print(lastChar)
        let index = text1.index(text1.startIndex, offsetBy: 2)
        print(text1[index])
        var msg = "Hello"
        msg.insert("!", at: msg.endIndex)
        print(msg)
        msg.remove(at: msg.index(before: msg.endIndex))
        print(msg)
        let greeting = "Hello, world!"
        let idx = greeting.firstIndex(of: ",")!
        let part = greeting[..<idx]
        print(part)
        let final = String(part)
        print(final)
        let scene = "Act 1 Scene 1"
        print(scene.hasPrefix("Act 1")) // true
        print(scene.hasSuffix("Scene 1")) // true
        
    }
}
