//
//  PasswordValidationProtocol.swift
//  NewLoginAssignment
//
//  Created by Rohan Ratnaparkhi on 7/26/16.
//  Copyright © 2016 Talentica. All rights reserved.
//

protocol PasswordValidationProtocol: AlphanumericProtocol { }

extension PasswordValidationProtocol {
    func validatePassword(password: String) -> ValidationMessage {
        if password == "" {
            return ValidationMessage.PasswordBlank
        } else if !validAlphanumeric(password) {
            return ValidationMessage.InvalidPassword
        } else if password.characters.count < 6 {
            return ValidationMessage.InvalidPassword
        } else {
            return ValidationMessage.Valid
        }
    }
}
