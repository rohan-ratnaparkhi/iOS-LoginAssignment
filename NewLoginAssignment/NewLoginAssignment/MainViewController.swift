//
//  MainViewController.swift
//  NewLoginAssignment
//
//  Created by Rohan Ratnaparkhi on 7/4/16.
//  Copyright © 2016 Talentica. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let MyKeychainWrapper = KeychainWrapper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.viewWithTag(1)?.hidden = true
        self.hideLogoutButton()
        
        let storedUsername = NSUserDefaults.standardUserDefaults().objectForKey(usernameKey) as? String ?? "N.A."
        let storedPassword = MyKeychainWrapper.myObjectForKey("v_Data") as? String ?? "N.A."
        
        if storedUsername == actualUsername && storedPassword == actualPassword {
            //display first page
            NSTimer.scheduledTimerWithTimeInterval(initialIntervalTime, target: self, selector: #selector(self.showFirstPage), userInfo: nil, repeats: false)
        } else {
            //display login page
            NSTimer.scheduledTimerWithTimeInterval(initialIntervalTime, target: self, selector: #selector(self.checkUserLogin), userInfo: nil, repeats: false)
        }
    }
    
    func checkUserLogin(){
        self.performSegueWithIdentifier("loginView", sender: self)
    }
    
    @IBAction func displayFirstScreen(segue: UIStoryboardSegue){
        self.showFirstPage()
    }
    
    func showFirstPage(){
        self.view.viewWithTag(2)?.hidden = true
        self.view.viewWithTag(3)?.hidden = true
        self.view.viewWithTag(4)?.hidden = true
        self.view.viewWithTag(1)?.hidden = false
        self.showEnabledLogoutButton()
    }
    
    func hideLogoutButton(){
        self.navigationItem.rightBarButtonItem?.enabled = false
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.clearColor()
    }
    
    func showEnabledLogoutButton(){
        self.navigationItem.rightBarButtonItem?.enabled = true
        self.navigationItem.rightBarButtonItem?.tintColor = nil
    }
    
    @IBAction func performUserLogout(){
        //remove stored credentials
        NSUserDefaults.standardUserDefaults().setObject("", forKey: usernameKey)
        MyKeychainWrapper.mySetObject("", forKey: kSecValueData)
        self.performSegueWithIdentifier("loginView", sender: self)
    }
}
