//
//  HomeVC.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 17/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit

class HomeVC: ParentVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(ControllersManager.sharedManager.revealViewController!.panGestureRecognizer())
    }

    
    //MARK: - SideBar
    @IBAction func menuTouched(sender: AnyObject) {
        ControllersManager.sharedManager.revealViewController?.revealToggleAnimated(true)
    }

}

// MARK: - Table view data source

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeCell", forIndexPath: indexPath) as! HomeCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        navigationController?.pushViewController(ControllersManager.getQueueDetailsVC(), animated: true)
    }

}
