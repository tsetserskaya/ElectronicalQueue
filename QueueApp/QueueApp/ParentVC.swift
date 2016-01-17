//
//  ParentVC.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 17/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit

class ParentVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    func hideKeyboard() {
        UIApplication.sharedApplication().sendAction(
            "resignFirstResponder", to:nil, from:nil, forEvent:nil)
    }
}
