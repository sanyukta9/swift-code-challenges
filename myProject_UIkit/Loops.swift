//
//  Loops.swift
//  myProject_UIkit
//
//  Created by Sanyukta Adhate on 13/01/26.
//
struct Loops{
    static func loop(){
            //For Loop-----------------------------------------------------------
        let n1 = [1, 2, 3, 4, 5]
        let n2 = [10, 20, 30, 40, 50]
        
            //1
        for i in 1...5{
            print(i)
        }
        print("*********")
            //2
        for _ in 1...5{
            print("hello")
        }
        print("*********")
            //3
        for i in 0..<n1.count{
            print(i)
        }
        print("*********")
            //4
        for i in n1[0]...4{
            print(n1[i])
        }
        print("*********")
            //        5
            //        for i in n2[0]...4{
            //            print(n2[i])
            //        }
            //        Here n2[0] is 10, so n2[i] becomes n2[10], which is out of range and thus will throw an error
        print("*********")
            //6
        for i in n1[0]...4{
            print(n2[i])
        }
        print("*********")
            //7
        for i in n1[0]...n1[3]{
            print(n1[i])
        }
        print("*********")
            //        8
            //        for i in n2[0]...n2[3]{
            //            print(n2[i])
            //        }
            //        Here n2[0] is 10, so n2[i] becomes n2[10], which is out of range and thus will throw an error
            //9
        for i in n1[0]...n1[3]{
            print(n2[i])
        }
        print("*********")
            //10
        for i in (n2[0]...n2[1]){
            print(i)
        }
        print("*********")
            //11
        for i in (n1[0]...n1[3]){
            print(n1[i])
        }
        print("*********")
            //12: stride exclude
        for i in stride(from: 0, to: 30, by: 5){
            print(i)
        }
        print("*********")
            //13: stride include
        for i in stride(from: 0, through: 10, by: 2){
            print(i)
        }
        print("*********")
        
            //       //while
            //        //1: Print numbers from 1 to 10
            //        var a = 1
            //        while a<=10{
            //            print (a)
            //            a+=1
            //        }
            //
            //        //2:  Print even numbers from 1 to 50
            //        var n = 1
            //        while n<=50{
            //            if(n%2==0){
            //                print(n)
            //            }
            //            n+=1
            //        }
            //
            //        //3: Sum of first n natural numbers
            //        var a = 1
            //        var sum = 0
            //        while n<=10{
            //            sum += n
            //            n+=1
            //        }
            //        print(sum)
            //
            //        //4: Multiplication table of a number
            //        var n = 1
            //        while(n<=10){
            //            var table = 9*n
            //            print("9 * \(n) = \(table)")
            //            n+=1
            //        }
            //
            //        //5: Countdown 10 to 1
            //        var n = 10
            //        while n>=1{
            //            print(n)
            //            n-=1
            //        }
            //        var n = 10
            //        repeat{
            //            print(n)
            //            n-=1
            //        }
            //        while n>=1
            //
            //                6: Count digits in a number
            //                var n = 123
            //                var sum = 0
            //                var count = 0
            //                while n > 0{
            //            var r = n % 10
            //            sum = sum * 10 + r
            //            n/=10
            //            count += 1
            //        }
            //        print(count)
            //
            //        10: Sum of digits in number
            //        7: Reverse a number
            //        var n = 123
            //        var sum = 0
            //        var res = 0
            //        while n > 0{
            //            var r = n % 10
            //            res += r
            //            sum = sum * 10 + r
            //            n/=10
            //        }
            //        print(res)
            //        print(sum)
            //        //8: Check if a number is a palindrome
            //        var n = 121
            //        let orig = n
            //        var sum = 0
            //        var res = 0
            //        while n > 0{
            //        var r = n % 10
            //        res += r
            //        sum = sum * 10 + r
            //        n/=10
            //        }
            //        if sum == orig{
            //            print("Yes it is  a palindrome")
            //        }
            //        else{
            //            print("No it is not  a palindrome")
            //        }
            //        //9: Factorial of a number
            //        var n = 5
            //        var fact = 1
            //        while n>0 {
            //            fact = fact * n
            //            n -= 1
            //        }
            //        print(fact)
        
        
            //1. Write a program using switch to print the day of the week based on a number (1–7).
            // var value = 4
            // switch value{
            //     case 1:
            //         print("Monday")
            //             case 2:
            //         print("Tuesday")
            //             case 3:
            //         print("Wednesday")
            //             case 4:
            //         print("Thursday")
            //             case 5:
            //         print("Friday")
            //             case 6:
            //         print("Saturday")
            //             case 7:
            //         print("Sunday")
            //             default:
            //         print("Wrong value")
            // }
            //2. Use switch with multiple matching values to build a simple calculator (+ - * /).
            // var op = "+"
            // var a: Int = 10
            // var b: Int = 20
            // switch op{
            //     case "+":
            //         print(a+b)
            //         case "-":
            //         print(a-b)
            //         case "*":
            //         print(a*b)
            //         case "/":
            //         print(a/b)
            //             default:
            //         print("Incorrect input")
            // }
            //3. Classify a number using switch with ranges (Fail, Pass, Distinction).
            // var marks = 75
            // switch marks{
            //     case 0..<35:
            //         print("Fail")
            //     case 35..<75:
            //         print("Pass")
            //     case 75...100:
            //         print("Distinction")
            //     default:
            //         print("Bravo!")
            // }
            //4. Use switch with where to determine if a number is positive even, positive odd, or negative.
            // var num : Int = -9
            // switch num{
            //     case let x where x>0 && x%2 == 0:
            //         print("Positive Even")
            //     case let x where x>0 && x%2 != 0:
            //         print("Positive Odd")
            //     default:
            //         print("Negative")
            // }
            //5.Write a switch statement to identify whether a character is a vowel, consonant, digit, or special character.
            // let ch = "6"
        
            // switch ch {
            // case "a", "e", "i", "o", "u",
            //      "A", "E", "I", "O", "U":
            //     print("Vowel")
        
            // case "0"..."9":
            //     print("Digit")
        
            // case "b"..."z", "B"..."Z":
            //     print("Consonant")
        
            // default:
            //     print("Special Character")
            // }
    }
}
