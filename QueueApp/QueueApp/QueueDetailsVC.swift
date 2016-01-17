//
//  QueueDetailsVC.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 17/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit

class QueueDetailsVC: ParentVC {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var datePicker: ATDatePickerField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension QueueDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QueueCell") as! QueueCell
        cell.date = NSDate(timeIntervalSince1970: Double(indexPath.row)*1200.0)
        if indexPath.row % 4 == 0 {
            cell.unavailabel()
        }
        return cell
    }
}
