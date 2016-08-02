//
//  ValidationMessage.swift
//  NewLoginAssignment
//
//  Created by Rohan Ratnaparkhi on 7/26/16.
//  Copyright © 2016 Talentica. All rights reserved.
//

enum ValidationMessage: String {
    case Valid = "Success"
    case UserNameBlank = "Email Id cannot be blank"
    case PasswordBlank = "Password cannot be blank"
    case InvalidEmailId = "Please enter valid email id"
    case InvalidPassword = "Password should be at least 6 characters and alphanumeric"
    case UserNamePasswordMismatch = "Username and/or password does not match"
}
