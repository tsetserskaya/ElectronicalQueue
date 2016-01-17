//
//  QueueUpVC.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 17/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit

class QueueUpVC: ParentVC {

    var shouldShowMenu = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if shouldShowMenu {
            let button = UIBarButtonItem(image: UIImage(named: "MenuIcon"), style: .Done, target: self, action: Selector("menuButtonTouched"))
            button.tintColor = UIColor.whiteColor()
            navigationItem.leftBarButtonItem = button
            view.addGestureRecognizer(ControllersManager.sharedManager.revealViewController!.panGestureRecognizer())
        }

    }

    func menuButtonTouched() {
        ControllersManager.sharedManager.revealViewController?.revealToggleAnimated(true)
    }

}

extension QueueUpVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeCell", forIndexPath: indexPath) as! HomeCell
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showDetail", sender: self)
    }
}
