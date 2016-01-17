//
//  SideBarVC.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 17/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit

class SideBarVC: UIViewController {
    
    private let identifier = "SideBarCell"
    
    @IBOutlet var buttons:[UIButton]?
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func homeButtonTouched(sender: AnyObject) {
        selectButtonWithTah(sender.tag)
        ControllersManager.showHomeVC()
    }

    @IBAction func queueUpTouched(sender: AnyObject) {
        selectButtonWithTah(sender.tag)
        ControllersManager.showQueueUpVC()
    }
    
    @IBAction func historyTouched(sender: AnyObject) {
        selectButtonWithTah(sender.tag)
        ControllersManager.showHistoryVC()
    }
    
    @IBAction func profileTouched(sender: AnyObject) {
        selectButtonWithTah(sender.tag)
        ControllersManager.showProfileVC()
    }
    
    @IBAction func logoutTouched(sender: AnyObject) {
        Login.deleteApiToken()
        ControllersManager.showLoginVC()
    }
    
    func selectButtonWithTah(tag: Int) {
        for (index, button) in buttons!.enumerate() {
            var fontName = "HelveticaNeue"
            if index == tag {
                fontName = "HelveticaNeue-Bold"
            }
            button.titleLabel?.font = UIFont(name: fontName, size: 16)
        }
    }
}

extension SideBarVC: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        return cell
    }
}
