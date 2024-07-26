//
//  LoginForm.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 29/03/2024.
//

import Foundation

public struct LoginForm: Codable {
    
    let emailAddress: String
    let password: String
    
    public init(emailAddress: String, password: String) {
        self.emailAddress = emailAddress
        self.password = password
    }
    
    enum CodingKeys: String, CodingKey {
        case emailAddress = "email"
        case password
    }
}
