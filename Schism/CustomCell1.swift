//
//  CustomCell1.swift
//  Schism
//
//  Created by Austin Zimmer on 12/12/14.
//  Copyright (c) 2014 Austin Zimmer. All rights reserved.
//


import Foundation
import UIkit

class CustomCell1: UITableViewCell {
    
    @IBOutlet weak var l1: UILabel!
    
    @IBOutlet weak var l2: UILabel!
    
    @IBOutlet weak var l3: UILabel!
    
    @IBOutlet weak var l4: UILabel!
    
    @IBOutlet weak var l5: UILabel!
    
    @IBOutlet weak var r5: UILabel!
    
    @IBOutlet weak var r4: UILabel!
    
    @IBOutlet weak var r3: UILabel!
    
    @IBOutlet weak var r2: UILabel!
    
    @IBOutlet weak var r1: UILabel!
    
    
    //actually left
    @IBOutlet weak var resultRight: UILabel!
    
    //actually right
    @IBOutlet weak var resultLeft: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var creator: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func initBars(val: Int){
        var curWager = val
        
        if(curWager == 0){
            r1.backgroundColor = UIColor.blackColor()
            r2.backgroundColor = UIColor.blackColor()
            r3.backgroundColor = UIColor.blackColor()
            r4.backgroundColor = UIColor.blackColor()
            r5.backgroundColor = UIColor.blackColor()
            l1.backgroundColor = UIColor.blackColor()
            l2.backgroundColor = UIColor.blackColor()
            l3.backgroundColor = UIColor.blackColor()
            l4.backgroundColor = UIColor.blackColor()
            l5.backgroundColor = UIColor.blackColor()
            
        }
        
        if(curWager > 0){
            if(curWager == 1){
                r1.backgroundColor = UIColor.orangeColor()
                r2.backgroundColor = UIColor.blackColor()
                r3.backgroundColor = UIColor.blackColor()
                r4.backgroundColor = UIColor.blackColor()
                r5.backgroundColor = UIColor.blackColor()
            }
            if(curWager == 2){
                r1.backgroundColor = UIColor.orangeColor()
                r2.backgroundColor = UIColor.orangeColor()
                r3.backgroundColor = UIColor.blackColor()
                r4.backgroundColor = UIColor.blackColor()
                r5.backgroundColor = UIColor.blackColor()
            }
            if(curWager == 3){
                r1.backgroundColor = UIColor.orangeColor()
                r2.backgroundColor = UIColor.orangeColor()
                r3.backgroundColor = UIColor.orangeColor()
                r4.backgroundColor = UIColor.blackColor()
                r5.backgroundColor = UIColor.blackColor()
            }
            if(curWager == 4){
                r1.backgroundColor = UIColor.orangeColor()
                r2.backgroundColor = UIColor.orangeColor()
                r3.backgroundColor = UIColor.orangeColor()
                r4.backgroundColor = UIColor.orangeColor()
                r5.backgroundColor = UIColor.blackColor()
            }
            if(curWager == 5){
                r1.backgroundColor = UIColor.orangeColor()
                r2.backgroundColor = UIColor.orangeColor()
                r3.backgroundColor = UIColor.orangeColor()
                r4.backgroundColor = UIColor.orangeColor()
                r5.backgroundColor = UIColor.orangeColor()
            }
        }
        if(curWager < 0){
            if(curWager == -1){
                l1.backgroundColor = UIColor.orangeColor()
                l2.backgroundColor = UIColor.blackColor()
                l3.backgroundColor = UIColor.blackColor()
                l4.backgroundColor = UIColor.blackColor()
                l5.backgroundColor = UIColor.blackColor()
            }
            if(curWager == -2){
                l1.backgroundColor = UIColor.orangeColor()
                l2.backgroundColor = UIColor.orangeColor()
                l3.backgroundColor = UIColor.blackColor()
                l4.backgroundColor = UIColor.blackColor()
                l5.backgroundColor = UIColor.blackColor()
            }
            if(curWager == -3){
                l1.backgroundColor = UIColor.orangeColor()
                l2.backgroundColor = UIColor.orangeColor()
                l3.backgroundColor = UIColor.orangeColor()
                l4.backgroundColor = UIColor.blackColor()
                l5.backgroundColor = UIColor.blackColor()
            }
            if(curWager == -4){
                l1.backgroundColor = UIColor.orangeColor()
                l2.backgroundColor = UIColor.orangeColor()
                l3.backgroundColor = UIColor.orangeColor()
                l4.backgroundColor = UIColor.orangeColor()
                l5.backgroundColor = UIColor.blackColor()
            }
            if(curWager == -5){
                l1.backgroundColor = UIColor.orangeColor()
                l2.backgroundColor = UIColor.orangeColor()
                l3.backgroundColor = UIColor.orangeColor()
                l4.backgroundColor = UIColor.orangeColor()
                l5.backgroundColor = UIColor.orangeColor()
            }
        }
    }

    
    
    
}