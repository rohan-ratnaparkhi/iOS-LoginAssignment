//
//  LoginViewController.swift
//  NewLoginAssignment
//
//  Created by Rohan Ratnaparkhi on 7/4/16.
//  Copyright © 2016 Talentica. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{
 
    @IBOutlet var userName: UITextField!
    @IBOutlet var userPassword: UITextField!
    @IBOutlet var passwordVisibilityButton: UIButton!
    let MyKeychainWrapper = KeychainWrapper()
    var authenticationSuccessful = false
    
    @IBAction func loginWithCredentials(){
        //check and store credentials on successful login and display first screen
        //else show proper error message
        guard let uEmail = userName.text where uEmail != "" else {
            displaySimpleAlert("Error", message: "Email id is mandatory")
            return
        }
        
        if !CommonUtil.isEmailFormat(uEmail) {
            displaySimpleAlert("Error", message: "Please enter a valid email id")
            return
        }
        
        guard let uPwd = userPassword.text where uPwd != "" else {
            displaySimpleAlert("Error", message: "Password is mandatory")
            return
        }
        
        if uPwd.characters.count < 6 {
            displaySimpleAlert("Error", message: "Password should be at least 6 characters long")
            return
        }
        
        if !CommonUtil.isPasswordAlphanumeric(uPwd) {
            displaySimpleAlert("Error", message: "Password should be alphanumeric")
            return
        }
        
        if uEmail == actualUsername && uPwd == actualPassword {
            NSUserDefaults.standardUserDefaults().setObject(uEmail, forKey: "UserName")
            MyKeychainWrapper.mySetObject(uPwd, forKey: kSecValueData)
            MyKeychainWrapper.writeToKeychain()
            authenticationSuccessful = true
        } else {
            displaySimpleAlert("Error", message: "Username / Password does not match")
            return
        }
        
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "dismissLoginView" {
            return authenticationSuccessful
        }
        return true
    }
    
    @IBAction func togglePasswordVisibility(){
        //to show or hide password
        if self.userPassword.secureTextEntry == true {
            self.userPassword.secureTextEntry = false
            self.passwordVisibilityButton.setTitle("HIDE", forState: .Normal)
        } else {
            self.userPassword.secureTextEntry = true
            self.passwordVisibilityButton.setTitle("SHOW", forState: .Normal)
        }
    }
    
    func displaySimpleAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
}
