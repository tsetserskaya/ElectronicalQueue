//
//  EditTextField.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 17/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit

class EditTextField: UITextField {

    var _editMode:Bool = false
    
    var editMode:Bool {
        get {
            return self.enabled
        }
        set (aNewValue) {
            self._editMode = aNewValue
            
            if _editMode {
                self.enabled = true
                self.borderStyle = UITextBorderStyle.RoundedRect
                self.backgroundColor = UIColor.whiteColor()
            }else{
                self.enabled = false
                self.borderStyle = UITextBorderStyle.None
                self.backgroundColor = UIColor.clearColor()
            }
        }
    }
}
