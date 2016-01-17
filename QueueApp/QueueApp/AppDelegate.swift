//
//  AppDelegate.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 16/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.makeKeyAndVisible()
        
        if Login.isLoggedIn() {
            ControllersManager.showHomeVC()
        } else {
            ControllersManager.showLoginVC()
        }

        
        return true
    }
}

