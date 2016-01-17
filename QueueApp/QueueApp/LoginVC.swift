//
//  LoginVC.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 16/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit
import KVNProgress

class LoginVC: ParentVC {
    
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var loginTF: UITextField!
    var currentTextFieldFrame : CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        loginTF.addTarget(passwordTF, action: Selector("becomeFirstResponder"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        passwordTF.addTarget(self, action: Selector("resignFirstResponder"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("hideKeyboard")))
    }
    
    @IBAction func loginButtonTouched(sender: AnyObject) {
        KVNProgress.show()
        
        
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            if let _ = User.getUserWithName(self.loginTF.text!) {
                KVNProgress.showSuccessWithCompletion() {
                    let login = Login(login: "test", password: "test")
                    login.apiToken = self.loginTF.text!
                    login.saveApiToken()
                    ControllersManager.showHomeVC()
                }
            } else {
                KVNProgress.showError()
            }
        }
        
    }
    
}

