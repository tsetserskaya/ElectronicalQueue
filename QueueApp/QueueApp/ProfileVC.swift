//
//  ProfileVC.swift
//  QueueApp
//
//  Created by Sviatoslav Semeniuk on 17/01/2016.
//  Copyright © 2016 Sviatoslav Semeniuk. All rights reserved.
//

import UIKit

class ProfileVC: ParentVC {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var editButton: UIBarButtonItem!
    @IBOutlet var firstNameTF: EditTextField!
    @IBOutlet var lastNameTF: EditTextField!
    @IBOutlet var ageTF: EditTextField!
    @IBOutlet var phoneTF: EditTextField!
    @IBOutlet var countryTF: EditTextField!
    @IBOutlet var CityTF: EditTextField!
    @IBOutlet var AdressTF: EditTextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var textFields:[EditTextField]?
    
    let user = User.getUserWithName(Login.getApiToken()!)
    var currentTextFieldFrame : CGRect?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTF.text = user?.name
        lastNameTF.text = user?.lastName
        ageTF.text = user?.age
        phoneTF.text = user?.city
        CityTF.text = user?.city
        countryTF.text = user?.country
        AdressTF.text = user?.adress
        
        firstNameTF.addTarget(lastNameTF, action: Selector("becomeFirstResponder"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        lastNameTF.addTarget(ageTF, action: Selector("becomeFirstResponder"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        ageTF.addTarget(phoneTF, action: Selector("becomeFirstResponder"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        phoneTF.addTarget(countryTF, action: Selector("becomeFirstResponder"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        countryTF.addTarget(CityTF, action: Selector("becomeFirstResponder"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        CityTF.addTarget(AdressTF, action: Selector("becomeFirstResponder"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        AdressTF.addTarget(self, action: Selector("resignFirstResponder"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("hideKeyboard")))
        view.addGestureRecognizer(ControllersManager.sharedManager.revealViewController!.panGestureRecognizer())
        // Do any additional setup after loading the view.
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

    
    @IBAction func menuButtonTouched(sender: AnyObject) {
        ControllersManager.sharedManager.revealViewController?.revealToggleAnimated(true)
    }
    
    @IBAction func saveTouched(sender: AnyObject) {
        UIView.animateWithDuration(0.5) {
            for tf in self.textFields! {
                tf.editMode = false
            }
            self.saveButton.alpha = 0
            self.editButton.enabled = true
            self.editButton.tintColor = UIColor.whiteColor()
        }
        
        user?.name = firstNameTF.text
        user?.lastName = lastNameTF.text
        user?.age = ageTF.text
        user?.city = phoneTF.text
        user?.city = CityTF.text
        user?.phone = phoneTF.text 
        user?.country = countryTF.text
        user?.adress = AdressTF.text
        RestKitHelper.saveContext()
    }
    
    @IBAction func editProfileTouched(sender: AnyObject) {
        UIView.animateWithDuration(0.5) {
            for tf in self.textFields! {
                tf.editMode = true
            }
            self.saveButton.alpha = 1
            self.editButton.enabled = false
            self.editButton.tintColor = UIColor.clearColor()
        }
    }
    
    @IBAction func didBeginEditing(sender: AnyObject) {
        currentTextFieldFrame = sender.frame
    }
    
    //MARK: - Keyboard
    func keyboardWillShow(sender: NSNotification) {
        let userInfo: [NSObject : AnyObject] = sender.userInfo!
        let keyboardHeight = userInfo[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size.height
        
        if let frame = currentTextFieldFrame {
            let difference = (view.frame.size.height - keyboardHeight) - (frame.origin.y + frame.size.height + view.frame.origin.y)
            
            if difference < 0 {
                UIView.animateWithDuration(0.2, animations: {
                    self.scrollView.contentOffset.y = -difference
                })
            }
            
        }
    }
    
    func keyboardWillHide(sender: AnyObject) {
        scrollView.contentOffset.y = 0
    }


}
