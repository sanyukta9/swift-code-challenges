//
//  Sets.swift
//  myProject_UIkit
//
//  Created by Sanyukta Adhate on 12/01/26.
//

struct Sets {
    static func go(){
        
            //empty set
            //1
        var set = Set<Int>()
        print(set)
            //2
        let set1: Set<Int> = []
        print(set1)
            //3
        let set2: Set<String>
        set2 = []
        print(set2)
        
            //set using array literals
            //1
        let set4 = Set(["a","b","c"])
        print(set4)
            //2
        var set3: Set<Int> = [1,2,3,4,4]
        print(set3)
            //3
        let set5: Set = ["a","o,","k"]
        print(set5)
        
            //count n isEmpty
        print(set3.count)
        if (set.isEmpty){
            print("Empty")
        }
        
            //add,remove
        set3.insert(5)
        print(set3)
        set3.insert(2)
        print(set3)
        
        set.remove(1)
        print(set)
        set3.remove(3)
        print(set3)
        
        set3.removeAll()
        print(set3)
        
            //Iterating over a set
        let abc: Set<String> = ["a","c","b"]
            //1
        for i in abc{
            print(i)
            print("here " + "\(i)")
        }
            //2
        for i in abc.sorted(){
            print(i)
        }
        
            //set operations
        let odd: Set = [1, 3, 5, 7, 9]
        let even: Set = [0, 2, 4, 6, 8]
        let primes: Set = [2, 3, 5, 7]
        
        odd.union(even)
        odd.intersection(primes)
        odd.subtracting(primes)
        odd.symmetricDifference(primes)
        
        let a1: Set<Int> = [1, 2]
        let a2: Set<Int> = [1, 2, 3, 4, 5]
        let a3: Set<Int> = [6, 7]
        
        a1.isSubset(of: a2)
        a2.isSuperset(of: a1)
        a2.isDisjoint(with: a3)
        a1 == [2,1]
        
        
    }
}
