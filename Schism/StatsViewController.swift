//
//  StatsViewController.swift
//  Schism
//
//  Created by Austin Zimmer on 12/11/14.
//  Copyright (c) 2014 Austin Zimmer. All rights reserved.
//

import UIKit
import CoreLocation

class StatsViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var locationEnabled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add nav bar buttons
        self.addRightNavItemOnView()
        self.addLeftNavItemOnView()
        
        //start location services
        locationEnabled = setupLocationServices()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addRightNavItemOnView()
    {
        var addButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addClick:")
        
        var refreshButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh, target: self, action: "refreshClick:")
        
        self.navigationItem.setRightBarButtonItems([addButton, refreshButton], animated: true)
        
    }
    
    func addLeftNavItemOnView()
    {
        var fakeButton : UIBarButtonItem = UIBarButtonItem(title: "Schism", style: UIBarButtonItemStyle.Plain, target: self, action: "helpClick:")
        
        self.navigationItem.setLeftBarButtonItem(fakeButton, animated: true)
    }
    
    
    func refreshClick(sender:UIButton!)
    {
        if locationEnabled{
            locationManager.startUpdatingLocation()
        }
        else{
            println("Location services are not enabled")
        }
    }
    
    func helpClick(sender:UIButton!)
    {
        performSegueWithIdentifier("segStatsToHelp", sender: self)
    }
    
    func addClick(sender:UIButton!)
    {
        performSegueWithIdentifier("segStatsToAdd", sender: self)
    }
    
    //LOCATION SERVICES
    
    func setupLocationServices()->Bool{
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            return true
        } else {
            println("Location services are not enabled")
            return false
        }
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        locationManager.stopUpdatingLocation()
        if ((error) != nil) {
            print(error)
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var locationArray = locations as NSArray
        var locationObj = locationArray.lastObject as CLLocation
        var coord = locationObj.coordinate
        println(coord.latitude)
        data.lat = coord.latitude
        println(coord.longitude)
        data.lon = coord.longitude
        locationManager.stopUpdatingLocation()
        var status: Bool = data.refresh()
        if (status == false){
            println("error: cant update network data")
        }
        else{
            updateLabels()
        }
    }
    
    func updateLabels(){
        totPoints.text = "\(data.stats.num)"
        wagerPoints.text = "\(data.stats.wagerPoints)"
        creationPoints.text = "\(data.stats.createPoints)"
        leftPoints.text = "\(data.stats.lo)"
        rightPoints.text = "\(data.stats.hi)"
        leftString.text = "\(data.stats.leftString)"
        rightString.text = "\(data.stats.rightString)"
    }
    
    //UI CONNECTIONS
    @IBOutlet weak var totPoints: UILabel!
    
    @IBOutlet weak var wagerPoints: UILabel!
    
    @IBOutlet weak var creationPoints: UILabel!
    
    @IBOutlet weak var leftPoints: UILabel!
    
    @IBOutlet weak var leftString: UILabel!
    
    @IBOutlet weak var rightPoints: UILabel!
    
    @IBOutlet weak var rightString: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
