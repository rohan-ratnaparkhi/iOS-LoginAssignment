//
//  LoginViewController.swift
//  NewLoginAssignment
//
//  Created by Rohan Ratnaparkhi on 7/4/16.
//  Copyright © 2016 Talentica. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, EmailValidationProtocol, PasswordValidationProtocol{
 
    @IBOutlet var userName: UITextField!
    @IBOutlet var userPassword: UITextField!
    @IBOutlet var passwordVisibilityButton: UIButton!
    let keychainWrapper = KeychainWrapper()
    var authenticationSuccessful = false
    
    @IBAction func loginWithCredentials(){
        //check and store credentials on successful login and display first screen
        //else show proper error message
        
        let emailValidation = validateEmail(userName.text!)
        let passwordValidation = validatePassword(userPassword.text!)
        
        guard let email = userName.text where emailValidation == ValidationMessage.Valid else {
            displaySimpleAlert("Error", message: emailValidation.rawValue)
            return
        }
        guard let password = userPassword.text where passwordValidation == ValidationMessage.Valid else {
            displaySimpleAlert("Error", message: passwordValidation.rawValue)
            return
        }
        
        if email == Constants.StoredAppUser.userName && password == Constants.StoredAppUser.password {
            NSUserDefaults.standardUserDefaults().setObject(email, forKey: Constants.Keys.userName)
            keychainWrapper.setObject(password, forKey: kSecValueData)
            keychainWrapper.writeToKeychain()
            authenticationSuccessful = true
        } else {
            displaySimpleAlert("Error", message: ValidationMessage.UserNamePasswordMismatch.rawValue)
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
    
    
}
