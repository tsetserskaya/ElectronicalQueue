//
//  QueueCell.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 17/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit

class QueueCell: UITableViewCell {

    var date : NSDate? {
        didSet {
            statrLb.text = Helper.stringFromDate(date!)
            endLb.text = Helper.stringFromDate(date!.dateByAddingTimeInterval(1200.0))
        }
    }
    
    
    @IBOutlet var imageVIew: UIImageView!
    @IBOutlet var button: UIButton!
    @IBOutlet var lineView: UIView!
    @IBOutlet var statrLb: UILabel!
    @IBOutlet var endLb: UILabel!
    
    func unavailabel() {
        button.hidden  = true
        imageVIew.hidden = false
        lineView.backgroundColor = UIColor(red: 242/255, green: 157/255, blue: 114/255, alpha: 1)
        statrLb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        endLb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    @IBAction func buttonTouched(sender: AnyObject) {
        if button.selected  {
            button.selected = !button.selected
        } else {
            button.selected = !button.selected
            statrLb.textColor = UIColor(red: 52/255, green: 159/255, blue: 210/255, alpha: 1)
            endLb.textColor = UIColor(red: 52/255, green: 159/255, blue: 210/255, alpha: 1)
        }
    }
    
    override func prepareForReuse() {
        statrLb.text = ""
        endLb.text = ""
    }
}
