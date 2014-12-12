//
//  NewSchismViewController.swift
//  Schism
//
//  Created by Austin Zimmer on 12/11/14.
//  Copyright (c) 2014 Austin Zimmer. All rights reserved.
//

import UIKit

class NewSchismViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.myLeftTextField.delegate = self
        self.myRightTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true);
    }

    @IBOutlet weak var myLeftTextField: UITextField!
    
    @IBOutlet weak var myRightTextField: UITextField!
    
    @IBOutlet weak var postButton: UIButton!
    
    @IBAction func postButtonPress(sender: AnyObject) {
        println("posting bet")
        var left: String = ""
        var right: String = ""
        var valid: Bool = true
        if myLeftTextField.text != ""{
            left = myLeftTextField.text
        }
        else{
            valid = false
        }
        if myRightTextField.text != ""{
            right = myRightTextField.text
        }
        else{
            valid = false
        }
        if valid{
            println("uid: \(data.uid) lat: \(data.lat) lon: \(data.lon) leftTerm: \(left) rightTerm: \(right)")
            var posted : Bool = network.post(data.uid, lat: data.lat, lon: data.lon, leftTerm: left, rightTerm: right)
            if (posted){
                self.navigationController?.popViewControllerAnimated(true)
            }
            else{
                println("network error posting this schism")
            }
        }
        else{
            println("invalid schism: Please enter Text")
        }
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
