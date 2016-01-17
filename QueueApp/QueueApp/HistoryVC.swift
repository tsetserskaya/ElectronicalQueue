//
//  HistoryVC.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 17/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit

class HistoryVC: HomeVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(ControllersManager.sharedManager.revealViewController!.panGestureRecognizer())
        // Do any additional setup after loading the view.
    }
}
