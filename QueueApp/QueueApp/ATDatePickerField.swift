//
//  ATDatePickerField.swift
//  AirTranslator
//
//  Created by Sviatoslav Semeniuk on 13/11/2015.
//  Copyright © 2015 eKreative. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class ATDatePickerField: UITextField, UITextFieldDelegate {
    var date = NSDate()
    let dateFormatter = NSDateFormatter()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        delegate = self
        text = dateFormatter.stringFromDate(date)
        
    }
    
    
    //MARK: Action handlers
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        let picker = ActionSheetDatePicker(title: "", datePickerMode: .Date, selectedDate: NSDate(), doneBlock: { (picker, date, origin) in
                self.date = date as! NSDate
                self.text = self.dateFormatter.stringFromDate(self.date)
            }, cancelBlock: nil, origin: self)
        picker.showActionSheetPicker()
        return false
    }
}


