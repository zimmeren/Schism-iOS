//
//  network.swift
//  Schism
//
//  Created by Austin Zimmer on 12/11/14.
//  Copyright (c) 2014 Austin Zimmer. All rights reserved.
//

import Foundation
import UIKit

struct Schism {
    var creator : Bool = false
    var id : Int = 0
    var time : Int = 0
    var wager : Int = 0
    var leftString : String = ""
    var rightString : String = ""
    var leftScore : Int = 0
    var rightScore : Int = 0
    
    init(inCreator: Bool, inID: Int, inTime: Int, inWager: Int, inLeftString: String, inRightString: String, inLeftScore: Int, inRightScore: Int){
        creator = inCreator
        id = inID
        time = inTime
        wager = inWager
        leftString = inLeftString
        rightString = inRightString
        leftScore = inLeftScore
        rightScore = inRightScore
    }
    
    init(inCreator: Bool, inID: Int, inTime: Int, inWager: Int, inLeftString: String, inRightString: String){
        creator = inCreator
        id = inID
        time = inTime
        wager = inWager
        leftString = inLeftString
        rightString = inRightString
    }
    
    init(){}
}

struct Stats {
    var num : Int = 0
    var numC : Int = 0
    var createPoints : Int = 0
    var hi : Int = 0
    var lo : Int = 0
    var leftString : String = ""
    var rightString : String = ""
    var wager : Int = 0
    var wagerPoints : Int = 0
    
    init(inNum: Int, inNumC: Int, inCreatePoints: Int, inHi: Int, inLo: Int, inLeftString: String, inRightString: String, inWager: Int, inWagerPoints: Int){
        num = inNum
        numC = inNumC
        createPoints = inCreatePoints
        hi = inHi
        lo = inLo
        leftString = inLeftString
        rightString = inRightString
        wager = inWager
        wagerPoints = inWagerPoints
    }
    
    init(){}
}

class SchismNetworkConnection {
    let baseurl = NSURL(string:"http://www.ckershaw.com/")
    
    init(){
    }
    
    func getNearby(uID: Int, lat: Double, lon: Double, offset: Int, dist: Double) -> [Schism]?{
        var schismList : [Schism]? = []
        
        var handlerString = "live"
        var dataString = "uid=\(uID)&lat=\(lat)&lon=\(lon)&dist=\(dist)&offset=\(offset)"
        if let result = networkCall(handlerString, data: dataString){
            for object in result {
                var newSchism = Schism(inCreator: object["creator"] as Bool, inID: object["id"] as Int, inTime: object["time"] as Int, inWager: object["wager"] as Int, inLeftString: object["line1"] as String, inRightString: object["line2"] as String, inLeftScore: object["hi"] as Int, inRightScore: object["lo"] as Int)
                schismList! += [newSchism]
            }
        }
        else{
            schismList = nil
        }
        return schismList
    }
    
    func getMyLive(uID: Int, offset: Int) -> [Schism]?{
        var schismList : [Schism]? = []
        
        var handlerString = "mylive"
        var dataString = "uid=\(uID)"
        if let result = networkCall(handlerString, data: dataString){
            for object in result {
                var newSchism = Schism(inCreator: object["creator"] as Bool, inID: object["id"] as Int, inTime: object["time"] as Int, inWager: object["wager"] as Int, inLeftString: object["line1"] as String, inRightString: object["line2"] as String)
                schismList! += [newSchism]
            }
        }
        else{
            schismList = nil
        }
        return schismList
    }
    
    func getMyHistory(uID: Int, offset: Int) -> [Schism]?{
        var schismList : [Schism]? = []
        
        var handlerString = "hist"
        var dataString = "uid=\(uID)"
        if let result = networkCall(handlerString, data: dataString){
            for object in result {
                var newSchism = Schism(inCreator: object["creator"] as Bool, inID: object["id"] as Int, inTime: object["time"] as Int, inWager: object["wager"] as Int, inLeftString: object["line1"] as String, inRightString: object["line2"] as String, inLeftScore: object["hi"] as Int, inRightScore: object["lo"] as Int)
                schismList! += [newSchism]
            }
        }
        else{
            schismList = nil
        }
        return schismList
    }
    
    func post(uID:Int, lat:Double, lon: Double, leftTerm: String, rightTerm: String) -> Bool{
        var posted : Bool = false
        
        var handlerString = "create"
        var dataString = "uid=\(uID)&lat=\(lat)&lon=\(lon)&line1=\(leftTerm)&line2=\(rightTerm)"
        if let result : NSDictionary = networkCall2(handlerString, data: dataString){
            
            if result["response"] as String == "OK"{
                posted = true
            }
            else{
                println("JudgeBet Server Response: \(result)")
            }
        }
        return posted
    }
    
    func join(uID:Int, bid: Int, wager: Int) -> Bool{
        var posted : Bool = false
        
        var handlerString = "join"
        var dataString = "uid=\(uID)&bid=\(bid)&wager=\(wager)"
        if let result : NSDictionary = networkCall2(handlerString, data: dataString){
            
            if result["response"] as String == "OK"{
                posted = true
            }
            else{
                println("JudgeBet Server Response: \(result)")
            }
        }
        return posted
    }
    
    func getUID() -> Int?{
        var id :Int? = -1
        
        var handlerString = "uid"
        var dataString = ""
        if let result : NSDictionary = networkCall2(handlerString, data: dataString){
            
            if result["response"] as String == "OK"{
                id! = result["uid"] as Int
            }
            else{
                println("JudgeBet Server Response: \(result)")
                id = nil
            }
        }
        else{
            id = nil
        }
        
        return id
    }
    
    func getStats(uID : Int) -> Stats?{
        var stats : Stats? = Stats()
        var handlerString = "stats"
        var dataString = ""
        if let result : NSDictionary = networkCall2(handlerString, data: dataString){
            stats = Stats(inNum: result["num"] as Int, inNumC: result["numc"] as Int, inCreatePoints: result["create_points"] as Int, inHi: result["hi"] as Int, inLo: result["lo"] as Int, inLeftString: result["line1"]as String, inRightString: result["line2"] as String, inWager: result["wager"] as Int, inWagerPoints: result["wager_points"] as Int)
        }
        else{
            stats = nil
        }
        return stats
    }
    
    func networkCall(handler: String, data: String)->NSArray?{
        //FOR ARRAY RESPONSES
        var jsonResult: NSArray?
        
        var myurl = NSURL(string: handler, relativeToURL: baseurl)
        
        if (myurl != nil){
            
            var url: NSURL = myurl!
            
            var request: NSMutableURLRequest = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.allowsCellularAccess = true
            
            let data = (data as NSString).dataUsingEncoding(NSUTF8StringEncoding)
            if (data != nil){
                var requestBodyData: NSData = data!
                
                request.HTTPBody = requestBodyData
                
                var response: AutoreleasingUnsafeMutablePointer <NSURLResponse?>=nil
                
                var error: AutoreleasingUnsafeMutablePointer <NSErrorPointer?>=nil
                var dataVal: NSData? =  NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error:nil)
                if dataVal != nil{
                    var err: NSError
                    
                    let newStr = NSString(data: dataVal!, encoding: NSUTF8StringEncoding)!
                    //println("server response string \(newStr)")
                    
                    jsonResult = NSJSONSerialization.JSONObjectWithData(dataVal!, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSArray
                    println("PublicBetList\(jsonResult)")
                    
                    return jsonResult
                }
            }
        }
        
        jsonResult = nil
        return jsonResult
    }
    
    func networkCall2(handler: String, data: String)->NSDictionary?{
        //FOR SINGLE ITEM RESPONSES
        
        var jsonResult: NSDictionary?
        
        var myurl = NSURL(string: handler, relativeToURL: baseurl)
        
        if (myurl != nil){
            
            var url: NSURL = myurl!
            
            var request: NSMutableURLRequest = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.allowsCellularAccess = true
            
            let data = (data as NSString).dataUsingEncoding(NSUTF8StringEncoding)
            if (data != nil){
                var requestBodyData: NSData = data!
                
                request.HTTPBody = requestBodyData
                
                var response: AutoreleasingUnsafeMutablePointer <NSURLResponse?>=nil
                
                var error: AutoreleasingUnsafeMutablePointer <NSErrorPointer?>=nil
                var dataVal: NSData? =  NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error:nil)
                if dataVal != nil{
                    var err: NSError
                    
                    let newStr = NSString(data: dataVal!, encoding: NSUTF8StringEncoding)!
                    //println("server response string \(newStr)")
                    
                    jsonResult = NSJSONSerialization.JSONObjectWithData(dataVal!, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary
                    println("PublicBetList\(jsonResult)")
                    
                    return jsonResult
                }
            }
        }
        jsonResult = nil
        return jsonResult
    }
}

//declare network conneciton for app
var network = SchismNetworkConnection()

//TESTING 

/*var network = SchismNetworkConnection()

let curID : Int = 1
let curLat : Double = 42.2814
let curLon : Double = -83.7483
let curOffset : Int = 0
let curDist : Double = 2.0
let curLeftTerm : String = "Charlies Fish Bowl"
let curRightTerm : String = "Rick's Shark Bowl"
let curBid : Int = 28
let curWager : Int = 3*/

//test nearby
/*var nearbyList : [Schism]? = network.getNearby(curID, lat: curLat, lon: curLon, offset: curOffset, dist: curDist)
if nearbyList != nil{
println("\(nearbyList!.count)")
}
else{
println("error network.getNearby() is returning nil")
}*/

//test my
/*var myLiveList : [Schism]? = network.getMyLive(curID, offset: curOffset)
if myLiveList != nil{
println("\(myLiveList!.count)")
}
else{
println("error network.getMyLive() is returning nil")
}*/

//test history
/*var myHistoryList : [Schism]? = network.getMyHistory(curID, offset: curOffset)
if myHistoryList != nil{
println("\(myHistoryList!.count)")
}
else{
println("error network.getMyHistory() is returning nil")
}*/

//test post
//var posted : Bool = network.post(curID, lat: curLat, lon: curLon, leftTerm: curLeftTerm, rightTerm: curRightTerm)
//println("\(posted)")

//test uid
/*var newID : Int? = network.getUID()
if newID != nil{
println("\(newID!)")
}
else{
println("error: network.getUID() has returned nil")
}*/

//test stats
/*var stats : Stats? = network.getStats(curID)
if stats != nil{
println("\(stats!.hi)")
}
else{
println("error: network.getStats() returned nil")
}*/

//test join
//var joined : Bool = network.join(curID, bid: curBid, wager: curWager)
//println("\(joined)")
