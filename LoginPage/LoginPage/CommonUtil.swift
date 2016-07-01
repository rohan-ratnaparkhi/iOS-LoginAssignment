//
//  CommonUtil.swift
//  LoginPage
//
//  Created by Rohan Ratnaparkhi on 6/30/16.
//  Copyright © 2016 Talentica. All rights reserved.
//

import UIKit

public class CommonUtil {
    public static func isEmailFormat(email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
    }
    
    public static func isPasswordAlphanumeric(password: String) -> Bool {
        if password.rangeOfCharacterFromSet(.letterCharacterSet(), options: .LiteralSearch, range: nil) == nil || password.rangeOfCharacterFromSet(.decimalDigitCharacterSet(), options: .LiteralSearch, range: nil) == nil {
            return false
        }
        return true
    }
    
}
