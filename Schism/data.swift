//
//  data.swift
//  Schism
//
//  Created by Austin Zimmer on 12/11/14.
//  Copyright (c) 2014 Austin Zimmer. All rights reserved.
//

import Foundation

class Data{
    var uid: Int = 0
    var lat: Double = 42.2814
    var lon: Double = -83.7483
    var offset: Int = 0
    var dist: Double = 2.0
    var nearbyList: [Schism] = []
    var myList: [Schism] = []
    var historyList: [Schism] = []
    var stats : Stats = Stats()
    
    init(){}
    
    func refresh()->Bool{
        var status: Bool = true
        
        // Get Nearby List
        var nearbyListTemp : [Schism]? = network.getNearby(uid, lat: lat, lon: lon, offset: offset, dist: dist)
        if nearbyListTemp != nil{
            nearbyList = nearbyListTemp!
        }
        else{
            println("error network.getNearby() is returning nil")
            status = false
        }
        
        // Get My List
        var myLiveListTemp : [Schism]? = network.getMyLive(uid, offset: offset)
        if myLiveListTemp != nil{
            myList = myLiveListTemp!
        }
        else{
            println("error network.getMyLive() is returning nil")
            status = false
        }
        
        // Get History List
        var myHistoryListTemp : [Schism]? = network.getMyHistory(uid, offset: offset)
        if myHistoryListTemp != nil{
            historyList = myHistoryListTemp!
        }
        else{
            println("error network.getMyHistory() is returning nil")
            status = false
        }
        
        // Get Stats
        var statsTemp : Stats? = network.getStats(uid)
        if statsTemp != nil{
            stats = statsTemp!
        }
        else{
            println("error: network.getStats() returned nil")
            status = false
        }
        
        return status
    }
    
    func updatePosition()->Bool{
        var status: Bool = true
        
        
        
        return status
    }
}

//initialize class data for the app
var data = Data()
