//
//  Session3.swift
//  myProject_UIkit
//
//  Created by Sanyukta Adhate on 12/01/26.
//

    //struct is basically used to create our own data type - blueprint for a student
struct Student {
    var name: String
    var marks: Int
}

    //container
struct Session3 {
    
        //there is this contatiner Session3 we cant access it without creating an object of tht container. But if we want to access it w/o creating an object then we need to make it as a static. Now we can directly call it in main-> Session3.run()
    static func run() {
            //here in this array marksheet: each element is a student's object
        let marksheet = [
            Student(name: "sanyukta", marks: 50),
            Student(name: "bimala", marks: 100)
        ]
        
        let result = hasStudentPassed(student: marksheet[0])
        print(result)
    }
    
        //static - callable without object
    static func hasStudentPassed(student: Student) -> Bool {
        if student.marks >= 50{
            return true
        }
        return false
    }
}

