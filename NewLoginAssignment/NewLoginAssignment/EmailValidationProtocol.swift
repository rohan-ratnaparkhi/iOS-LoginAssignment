//
//  EmailValidationProtocol.swift
//  NewLoginAssignment
//
//  Created by Rohan Ratnaparkhi on 7/26/16.
//  Copyright © 2016 Talentica. All rights reserved.
//

protocol EmailValidationProtocol { }

extension EmailValidationProtocol {
    
    func validEmailFormat(email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
    }
    
    func validateEmail(emailId: String) -> ValidationMessage{
        if emailId == "" {
            return ValidationMessage.UserNameBlank
        } else if !validEmailFormat(emailId) {
            return ValidationMessage.InvalidEmailId
        } else {
            return ValidationMessage.Valid
        }
    }
}