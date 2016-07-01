//
//  FirstPageViewController.swift
//  LoginPage
//
//  Created by Rohan Ratnaparkhi on 6/30/16.
//  Copyright © 2016 Talentica. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController{
    
    let MyKeychainWrapper = KeychainWrapper()
    
    @IBAction func logoutUser(sender: AnyObject){
        print("we are done ")
        //remove username & password
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("", forKey: "UserName")
        MyKeychainWrapper.mySetObject("", forKey: kSecValueData)
//        defaults.setObject("", forKey: "UserPassword")
//        self.dismissViewControllerAnimated(true, completion: nil)
        //display login screen
        if let loginPageController = storyboard!.instantiateViewControllerWithIdentifier("loginController") as? LoginViewController {
            presentViewController(loginPageController, animated: true, completion: nil)
        }
    }
    
}
