//
//  User.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 02/04/2024.
//

import Foundation

public struct User: Codable {
    let id: String?
    let name: String?
    let email: String?
    let phone: String?
    let userType: String?
    let client: Client?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case email
        case phone
        case userType
        case client
    }
}

public struct Client: Codable {
    let id: String?
    let wallet: Double?
    let pendingOrders: Int?
    let cancelledOrders: Int?
    let completedOrders: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case wallet
        case pendingOrders
        case cancelledOrders
        case completedOrders
    }
}
