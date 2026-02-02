//
//  testProperties.swift
//  myProject_UIkit
//
//  Created by Sanyukta Adhate on 12/01/26.
//

struct Properties {
    var a: Int
    let b: Int
}
struct Rectangle {
    var width: Double
    var height: Double
    
    var area: Double {
        return width * height
    }
}
struct Line {
    var start: Double
    var end: Double
    var midPoint: Double {
        get {
                //avg
            start + end / 2
        }
        set {
            start = newValue - end / 2
        }
    }
}

    //wrapper
@propertyWrapper
struct MaxFive {
    private var value = 0
    
    var wrappedValue: Int {
        get { value }
        set { value = min(newValue, 5) }
    }
}
struct Player {
    @MaxFive var level: Int
}

    //Wrapper with Arguments
@propertyWrapper
struct Limit {
    private var max: Int
    private var value: Int
    
    var wrappedValue: Int {
        get { value }
        set { value = min(newValue, max) }
    }
    
    init(wrappedValue: Int, max: Int) {
        self.max = max
        self.value = min(wrappedValue, max)
    }
}
struct VideoSettings {
    @Limit(wrappedValue: 5, max: 10) var brightness: Int
    @Limit(wrappedValue: 2, max: 5) var volume: Int
}

    //Projected Value ($)
@propertyWrapper
struct CapAtTen {
    private var value = 0
    private(set) var projectedValue = false
    
    init() {}
    
    var wrappedValue: Int {
        get { value }
        set {
            if newValue > 10 {
                value = 10
                projectedValue = true
            } else {
                value = newValue
                projectedValue = false
            }
        }
    }
}
struct Test {
    @CapAtTen var marks: Int
}

    //$$$$$$$$$$$$$$$$$$$$$$$$//
class Counter {
    var count = 0
}
class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
}
class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set to \(newValue)")
        }
        didSet {
            print("Added \(totalSteps - oldValue) steps")
        }
    }
}

func testProperties() {
    
        //1. stored
        //struct-
    var c = Properties(a: 10, b: 20)
    c.a = 100
    print(c.a)
        //c.b = 200 - Cannot assign to property: 'b' is a 'let' constant
    
    let d = Properties(a: 50, b: 70)
        //d.a = 100 - Cannot assign to property: 'd' is a 'let' constant
    print(d.a)
        //d.b = 200 - Cannot assign to property: 'd' is a 'let' constant
    print(d.b)
    
        //class
    let x = Counter()
    x.count = 10
    print(x.count)
    
        //lazy
    let manager = DataManager()
        //print(manager.data.append("Hello")) - returns ()
    manager.data.append("Hello")
    print(manager.data)
    print(manager.importer.filename)
    
    
        //2. computed
    let rect = Rectangle(width: 10, height: 5)
    print(rect.area)
    
        //get set
    var line = Line(start: 0, end: 10)
    print(line.midPoint)
    line.midPoint = 20
    print(line.start)
    
        //3. observers
    let step = StepCounter()
    step.totalSteps = 100
    step.totalSteps = 250
    
        //4. wrappers
        //simple
    var p = Player()
    p.level = 3
    print(p.level)
    p.level = 10
    print(p.level)
    
        //multiple args
    var v = VideoSettings()
    print(v.brightness, v.volume)
    
    v.brightness = 50
    v.volume = 20
    print(v.brightness, v.volume)
    
        //projected value
    var t = Test()
    t.marks = 8
    print(t.marks)
    print(t.$marks)
    
    t.marks = 50
    print(t.marks)
    print(t.$marks)
}


