//
//  AppDelegate.swift
//  Schism
//
//  Created by Austin Zimmer on 12/11/14.
//  Copyright (c) 2014 Austin Zimmer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //set navbar colors
        var navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = uicolorFromHex(0xffffff)
        navigationBarAppearace.barTintColor = uicolorFromHex(0xff9326)
        
        //set tabbar colors
        var tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.tintColor = uicolorFromHex(0xffffff)
        tabBarAppearance.barTintColor = uicolorFromHex(0xff9326)
        
        //set tabbar text size and color
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blackColor(), NSFontAttributeName:UIFont(name: "Arial-BoldMT", size: 20)!], forState:.Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName:UIFont(name: "Arial-BoldMT", size: 20)!], forState:.Selected)
        
        //set navbar text size and color
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName:UIFont(name: "Arial-BoldMT", size: 25)!], forState:.Normal)
        
        //Get UID from pList or Create one
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if let uid = defaults.objectForKey("uid") as? Int{
            println("ID FOUND: \(uid)")
            data.uid = uid
        }
        else{
            println("not found")
            if let newUID = network.getUID(){
                println("new id \(newUID)")
                defaults.setObject(newUID, forKey: "uid")
                data.uid = newUID
            }
            else{
                println("error: no network connection")
            }
        }
        
        //update GPS location
        var status1: Bool = data.updatePosition()
        if status1 == false{
            println("ERROR: GPS Location not updated")
        }
        
        //Get all network data
        var status2: Bool = data.refresh()
        if status2 == false{
            println("ERROR: Data Not Loaded")
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

