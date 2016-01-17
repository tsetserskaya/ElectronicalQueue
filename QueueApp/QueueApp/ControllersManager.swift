//
//  ControllersManager.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 16/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit
import SWRevealViewController

class ControllersManager: NSObject {
    
    var revealViewController : SWRevealViewController?
    static let sharedManager = ControllersManager()
    
    class func showLoginVC() {
        let loginViewController = UIStoryboard(name: Constants.Storyboards.Login, bundle: NSBundle.mainBundle()).instantiateInitialViewController()
        
        if ControllersManager.sharedManager.revealViewController != nil {
            UIView.transitionFromView(ControllersManager.sharedManager.revealViewController!.view, toView:loginViewController!.view , duration: 0.85, options: .TransitionFlipFromLeft, completion: { (finished) -> Void in
                ControllersManager.window().rootViewController = loginViewController
                ControllersManager.sharedManager.revealViewController = nil
            })
        } else {
            window().rootViewController = loginViewController
        }
        
    }
    
    class func showHomeVC() {
        let homeVC = UIStoryboard(name: Constants.Storyboards.Home, bundle: NSBundle.mainBundle()).instantiateInitialViewController()
        if ControllersManager.sharedManager.revealViewController == nil {
            ControllersManager.sharedManager.revealViewController = SWRevealViewController()
            
            let homeVC = UIStoryboard(name: Constants.Storyboards.Home, bundle: NSBundle.mainBundle()).instantiateInitialViewController()
            let sideBarVC = UIStoryboard(name: Constants.Storyboards.SideBar, bundle: NSBundle.mainBundle()).instantiateInitialViewController()
            
            ControllersManager.sharedManager.revealViewController!.frontViewController = homeVC
            ControllersManager.sharedManager.revealViewController!.rearViewController = sideBarVC
            ControllersManager.sharedManager.revealViewController!.frontViewShadowRadius = 0
            
            if window().rootViewController != nil {
                UIView.transitionFromView(window().rootViewController!.view, toView: ControllersManager.sharedManager.revealViewController!.view, duration: 0.65, options: .TransitionFlipFromRight, completion: { (finished) -> Void in
                    ControllersManager.window().rootViewController = ControllersManager.sharedManager.revealViewController!
                })
            } else {
                window().rootViewController = ControllersManager.sharedManager.revealViewController
            }
            
        } else {
            ControllersManager.sharedManager.revealViewController!.pushFrontViewController(homeVC, animated: true)
        }
    }
    
    class func showQueueUpVC() {
        let queueUpVC = UIStoryboard(name: Constants.Storyboards.Home, bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("QueueUpVCNavVC") as! UINavigationController
        (queueUpVC.viewControllers.first as? QueueUpVC)?.shouldShowMenu = true
        ControllersManager.sharedManager.revealViewController?.pushFrontViewController(queueUpVC, animated: true)
    }
    class func showProfileVC() {
        let profileVC = UIStoryboard(name: Constants.Storyboards.Profile, bundle: NSBundle.mainBundle()).instantiateInitialViewController()
        ControllersManager.sharedManager.revealViewController?.pushFrontViewController(profileVC, animated: true)
    }
    
    class func getQueueDetailsVC() -> QueueDetailsVC {
        return UIStoryboard(name: Constants.Storyboards.Home, bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("QueueDetailsVC") as! QueueDetailsVC
    }
    
    class func showHistoryVC()  {
        let historyVC = UIStoryboard(name: Constants.Storyboards.History, bundle: NSBundle.mainBundle()).instantiateInitialViewController()
        ControllersManager.sharedManager.revealViewController?.pushFrontViewController(historyVC, animated: true)
    }
    
    class func window() -> UIWindow! {
        return UIApplication.sharedApplication().delegate!.window!
    }
    
}
