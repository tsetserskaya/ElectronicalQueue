//
//  RegisterVC.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 16/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit
import KVNProgress

class RegisterVC: ParentVC {

    @IBOutlet var emailTF: UITextField!
    @IBOutlet var confirmPasswordTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var loginTF: UITextField!
    var currentTextFieldFrame : CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTF.addTarget(emailTF, action: Selector("becomeFirstResponder"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        emailTF.addTarget(passwordTF, action: Selector("becomeFirstResponder"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        passwordTF.addTarget(confirmPasswordTF, action: Selector("becomeFirstResponder"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        confirmPasswordTF.addTarget(self, action: Selector("resignFirstResponder"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("hideKeyboard")))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    


    @IBAction func registerTouched(sender: AnyObject) {
        KVNProgress.show()
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            if self.loginTF.text == "test" && self.passwordTF.text == "test" {
                KVNProgress.showSuccessWithCompletion() {
                    User.createUser(self.loginTF.text!)
                    let login = Login(login: self.loginTF.text!, password: "test")
                    login.apiToken = self.loginTF.text!
                    login.saveApiToken()
                    ControllersManager.showHomeVC()
                }
            } else {
                KVNProgress.showError()
            }
        }

    }

    @IBAction func loginTouched(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    //MARK: - Keyboard
    func keyboardWillShow(sender: NSNotification) {
        let userInfo: [NSObject : AnyObject] = sender.userInfo!
        let keyboardHeight = userInfo[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size.height
        
        if let frame = currentTextFieldFrame {
            let difference = (view.frame.size.height - keyboardHeight) - (frame.origin.y + frame.size.height + view.frame.origin.y)
            
            if difference < 0 {
                UIView.animateWithDuration(0.2, animations: {
                    self.view.frame.origin.y += difference
                })
            }
            
        }
    }
    
    func keyboardWillHide(sender: AnyObject) {
        self.view.frame.origin.y = 0
    }
    
    @IBAction func editingDidBegin(sender: AnyObject) {
        currentTextFieldFrame = sender.frame
    }

}
