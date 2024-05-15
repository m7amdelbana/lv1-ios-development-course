//
//  LoginResponse.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 29/03/2024.
//

import Foundation

public struct LoginResponse: Codable {
    let xAuthToken: String?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case xAuthToken = "x-auth-token"
        case type
    }
}
