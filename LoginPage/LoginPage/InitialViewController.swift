//
//  InitialViewController.swift
//  LoginPage
//
//  Created by Rohan Ratnaparkhi on 6/29/16.
//  Copyright © 2016 Talentica. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    let MyKeychainWrapper = KeychainWrapper()
    
    override func viewDidLoad() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let user = defaults.objectForKey("UserName") as? String ?? "N.A."
        print("userName: " + user)
//        let password = defaults.objectForKey("UserPassword") as? String ?? "N.A."
        let password = MyKeychainWrapper.myObjectForKey("v_Data") as? String ?? "N.A."
        print("userPassword: " + password)
        if user == userName && password == userPwd {
            print("display after login")
            NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(self.displayFirstPageAfterLogin), userInfo: defaults, repeats: false)
        } else {
            print("display login")
            NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(self.displayLoginPage), userInfo: defaults, repeats: false)
        }
    }
    
    func displayLoginPage(){
        print("hi")
        if let resultController = storyboard!.instantiateViewControllerWithIdentifier("loginController") as? LoginViewController {
            presentViewController(resultController, animated: true, completion: nil)
        }
    }
    
    func displayFirstPageAfterLogin(){
        if let firstPageController = storyboard!.instantiateViewControllerWithIdentifier("myNavigation") as? UINavigationController {
            presentViewController(firstPageController, animated: true, completion: nil)
        }
    }
    
}
