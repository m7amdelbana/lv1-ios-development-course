//
//  Validator.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 26/07/2024.
//

import Foundation

class Validator {
    
    static func isValidEmail(_ text: String) -> Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
        return pred.evaluate(with: text)
    }
    
    static func isValidPhone(_ text: String) -> Bool {
        let regEx = "^(010|011|012|015)[0-9]{8}$"
        let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
        return pred.evaluate(with: text)
    }
}
