//
//  LoginViewController.swift
//  LoginPage
//
//  Created by Rohan Ratnaparkhi on 6/29/16.
//  Copyright © 2016 Talentica. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var emailId: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var showHidePwdBtn: UIButton!
    let MyKeychainWrapper = KeychainWrapper()
    
    @IBAction func userSignIn(){
        
        emailId.text = userName
        password.text = userPwd
        
        guard let uEmail = emailId.text where uEmail != "" else {
            displaySimpleAlert("Error", message: "Email id is mandatory")
            return
        }
        
        if !CommonUtil.isEmailFormat(uEmail) {
            displaySimpleAlert("Error", message: "Please enter a valid email id")
            return
        }
        
        guard let uPwd = password.text where uPwd != "" else {
            displaySimpleAlert("Error", message: "Password is mandatory")
            return
        }
        
        if uPwd.characters.count < 6 {
            displaySimpleAlert("Error", message: "Password should be at least 6 characters")
            return
        }
        
        if !CommonUtil.isPasswordAlphanumeric(uPwd) {
            displaySimpleAlert("Error", message: "Password should be alphanumeric")
            return
        }
        
        if uEmail == userName && uPwd == userPwd {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(uEmail, forKey: "UserName")
//            defaults.setObject(uPwd, forKey: "UserPassword")
            MyKeychainWrapper.mySetObject(uPwd, forKey: kSecValueData)
            MyKeychainWrapper.writeToKeychain()
            displayNextScreen()
        } else {
            displaySimpleAlert("Error", message: "Username / Password does not match")
            return
        }
        
    }
    
    @IBAction func handlePasswordDisplay(){
        if self.password.secureTextEntry == true {
            self.password.secureTextEntry = false
            self.showHidePwdBtn.setTitle("HIDE", forState: .Normal)
        } else {
            self.password.secureTextEntry = true
            self.showHidePwdBtn.setTitle("SHOW", forState: .Normal)
        }
    }
    
    func displaySimpleAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func displayNextScreen(){
        if let firstPageController = storyboard!.instantiateViewControllerWithIdentifier("myNavigation") as? UINavigationController {
            presentViewController(firstPageController, animated: true, completion: nil)
        }
        
    }
    
    
}
