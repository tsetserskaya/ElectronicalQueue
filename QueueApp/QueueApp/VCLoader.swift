//
//  UIViewController+storyboardLoad.swift
//  FashionSwapp
//
//  Created by chublix on 9/6/15.
//  Copyright (c) 2015 eKreative. All rights reserved.
//

import Foundation
import UIKit

class VCLoader<VC> {
    class func load(storyboardName storyboard: String!) -> VC {
        let className = NSStringFromClass(VC.self as! AnyClass).componentsSeparatedByString(".").last!
        return VCLoader<VC>.load(storyboardName: storyboard, inStoryboardID: className)
    }
    
    class func load(storyboardName storyboard: String!, inStoryboardID: String!) -> VC {
        let storyboard = UIStoryboard(name: storyboard, bundle: NSBundle.mainBundle())
        return storyboard.instantiateViewControllerWithIdentifier(inStoryboardID) as! VC
    }
}
