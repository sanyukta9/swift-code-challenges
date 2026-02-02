//
//  ARC.swift
//  myProject_UIkit
//
//  Created by Sanyukta Adhate on 12/01/26.
//
class Sanyukta{
    var team: String = "iOS"
    var  bControlObj: Bimala?
    init(){
        print("SanyuktaA is Initialized")
    }
    deinit{
        print("SanyuktaA is Deinitialized")
    }
}
class Bimala{
    var department: String = "Engineering"
    var sControlObj: Sanyukta?
    init(){
        print("Sanyukta is Initialized")
    }
    deinit{
        print("Sanyukta is Deinitialized")
    }
}
class ARC{
    func Arc(){
        let sObj = Sanyukta()
        let bObj = Bimala()
        
        sObj.team = "WEB"
        bObj.department = "Marketing"
        print("SanyuktaA's team: \(sObj.team)")
        print("Sanyukta's team: \(bObj.department)")
        
        bObj.sControlObj = sObj
        sObj.bControlObj = bObj
        
        print("ARC is over")
    }
}

