//
//  Helper.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 16/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit
import CoreData

class Helper: NSObject {
    static let sharedHelper = Helper()
    let dateFormatter = NSDateFormatter()
    
    override init() {
        super.init()
        dateFormatter.dateFormat = "HH:MM"
    }
    
    
    class func stringFromDate(date : NSDate) -> String {
       return Helper.sharedHelper.dateFormatter.stringFromDate(date)
    }
    
}
