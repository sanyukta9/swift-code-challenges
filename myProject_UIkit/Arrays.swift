//
//  Arrays.swift
//  myProject_UIkit
//
//  Created by Sanyukta Adhate on 08/01/26.
//
struct Arrays {
    static func hit(){
        
            //Empty array
            //1
        let arr: [Int]=[]
        print(arr.count)
            //2
        let arr1 = [Int]()
        if(arr1.isEmpty){
            print("arr1 array is empty")
        }
        
            //default array
        let zeros: [Int] = Array(repeating: 0, count: 5)
        print(zeros)
        
            //add 2 arrays
        let a: [Int] = [1, 2, 3]
        let b: [Int] = [4, 5, 6]
        let c: [Int] = a + b
        print(c)
            // print(c[c.count]) -> as c.count=6 but array is 0th indexed which throws Fatal error: Index out of range
        
            //add elements in array and indexing
        var list = ["A", "B", "C"]
        list.append("D")
        list+=["E", "F"]
        print(list)
        list.insert("G", at: 0)
        print(list)
        list.insert("H", at: 2)
        print(list)
        
            //safe indexing
        let index: Int = 5
        if index < list.count {
            print(list[index])
        }
        
            //replacing range
        print(list) //["G", "A", "H", "B", "C", "D", "E", "F"]
                    //list list[2...5] = [] -> [G,A,E,F]
        list[2...5] = ["I","J","K","L","M","N","O"]
        print(list)
        
            //Iterating Over an Array
        print("Iterating Over an Array")
            //1
        for i in 0..<list.count {
            print(list[i])
        }
            //2
        for item in list {
            print(item)
        }
            //3
        for (index, element) in list.enumerated() {
            print("Item \(index): \(element)")
        }
            //4
        list.indices.forEach { index in
            print(list[index])
        }
    }
}
