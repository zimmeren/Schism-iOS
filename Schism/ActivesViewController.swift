//
//  ActivesViewController.swift
//  Schism
//
//  Created by Austin Zimmer on 12/11/14.
//  Copyright (c) 2014 Austin Zimmer. All rights reserved.
//

import UIKit

class ActivesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //add nav bar buttons
        self.addRightNavItemOnView()
        self.addLeftNavItemOnView()
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
        println("now refreshing")
    }
    
    func helpClick(sender:UIButton!)
    {
        performSegueWithIdentifier("segActiveToHelp", sender: self)
    }
    
    func addClick(sender:UIButton!)
    {
        performSegueWithIdentifier("segActiveToAdd", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
