import UIKit

var greeting = "Hello, playground"

//1. Write a function that takes an optional String and prints it only if it is not nil using guard let.
    // //**1**
func greet(name: String?) {
    guard let unwrappedName = name else {
        print("No name provided")
        return
    }
    print("Hello, \(unwrappedName)!")
}
greet(name: nil)
greet(name: "sanyukta")
greet(name: "")
    // //**2**
func greet1() {
    var name: String? = "Sanyukta"
    guard let unwrappedName = name else {
        print("No name provided")
        return
    }
    print("Hello, \(unwrappedName)!")
}
greet1()

//2. Create a function that accepts an optional Int and returns its square using guard let, otherwise exits early.
func demo(num: Int?){
    guard let unwrappedNum = num else{
        print("No integer provided")
        return
    }
    print("Heya \(unwrappedNum)")
}
demo(num: nil)
demo(num: 10)

//3. Write a function that takes two optional Int values and performs division using guard let, ensuring neither is nil and the divisor is not zero.
func doom(n1: Int?, n2: Int?){
    guard let unwrappedN1 = n1, let unwrappedN2 = n2, unwrappedN2 != 0  else{
        if n2 == 0{
            print("Divisor is zero")
        }
        else{
            print("Either n1 or n2 is nil")
        }
        return
    }
    let result = unwrappedN1/unwrappedN2
    print("Result is \(result)")
}
doom(n1 : 10, n2 : 5)
doom(n1 : 10, n2 : 0)
doom(n1 : 10, n2 : nil)
doom(n1 : nil, n2 : 5)

// 4. Use guard let to unwrap an optional array and print its elements; exit early if the array is nil or empty.
func dhoom(arr:  [Int]?){
    guard let unwrappedArr = arr, !unwrappedArr.isEmpty else{
        print("exit early")
        return
    }
    for i in unwrappedArr {
        print(i)
    }
}
dhoom(arr: [10,20,30])
dhoom(arr: [])

//5. Write a function that takes an optional String and uses guard let to check whether it can be converted into an Int Returning a value does NOT automatically print it.It does not print anything unless you explicitly call print
func zoom(str: String?) -> Int?{
    guard let unwrappedStr = str, let intValue = Int(unwrappedStr) else{
        print("value is nil or not a valid Int")
        return nil
    }
    print("converted to int \(intValue)")
    return intValue
}
zoom(str: "a")

//6. Write a function that simulates user login by unwrapping optional email and password values using guard let
func login(email: String?, password: String?){
    guard let unwrappedEmail = email, let unwrappedPwd = password else{
        print("email or password is nil")
        return
    }
    print("Email id: \(unwrappedEmail)\npassword: \(unwrappedPwd)")
}
login(email: "sanyukta.adhate@bookmyshow.com", password: "sansud1901")

