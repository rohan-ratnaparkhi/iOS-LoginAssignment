//
//  AlphanumericProtocol.swift
//  NewLoginAssignment
//
//  Created by Rohan Ratnaparkhi on 7/26/16.
//  Copyright © 2016 Talentica. All rights reserved.
//

protocol AlphanumericProtocol { }

extension AlphanumericProtocol {
    func validAlphanumeric(string: String) -> Bool {
        if string.rangeOfCharacterFromSet(.letterCharacterSet(), options: .LiteralSearch, range: nil) == nil || string.rangeOfCharacterFromSet(.decimalDigitCharacterSet(), options: .LiteralSearch, range: nil) == nil {
            return false
        }
        return true
    }
    
}
