//
//  MainViewController.swift
//  NewLoginAssignment
//
//  Created by Rohan Ratnaparkhi on 7/4/16.
//  Copyright © 2016 Talentica. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let keychainWrapper = KeychainWrapper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.viewWithTag(1)?.hidden = true
        self.navigationController?.navigationBarHidden = true
        
        let storedUsername = NSUserDefaults.standardUserDefaults().objectForKey(Constants.Keys.userName) as? String ?? "N.A."
        let storedPassword = keychainWrapper.getObjectForKey("v_Data") as? String ?? "N.A."
        
        if storedUsername == Constants.StoredAppUser.userName && storedPassword == Constants.StoredAppUser.password {
            //display first page
            NSTimer.scheduledTimerWithTimeInterval(Constants.Time.initialIntervalTime, target: self, selector: #selector(self.showFirstPage), userInfo: nil, repeats: false)
        } else {
            //display login page
            NSTimer.scheduledTimerWithTimeInterval(Constants.Time.initialIntervalTime, target: self, selector: #selector(self.checkUserLogin), userInfo: nil, repeats: false)
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
        self.navigationController?.navigationBarHidden = false
    }
    
    @IBAction func performUserLogout(){
        //remove stored credentials
        NSUserDefaults.standardUserDefaults().setObject("", forKey: Constants.Keys.userName)
        keychainWrapper.setObject("", forKey: kSecValueData)
        self.performSegueWithIdentifier("loginView", sender: self)
    }
}
