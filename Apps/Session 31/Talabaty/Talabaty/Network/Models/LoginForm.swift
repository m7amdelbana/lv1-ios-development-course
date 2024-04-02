//
//  LoginForm.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 29/03/2024.
//

import Foundation

struct LoginForm: Codable {
    let emailAddress: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case emailAddress = "email"
        case password
    }
}
