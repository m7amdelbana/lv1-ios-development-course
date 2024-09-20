//
//  Cart.swift
//  TalabatyCore
//
//  Created by Mohamed Elbana on 20/09/2024.
//

import Foundation

public struct Cart: Codable {
    
    public let id: String?
    public let estimatePrice: Double?
    public let quantity: Int?
    public let productId: String?
    public let product: Product?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case estimatePrice
        case quantity
        case productId
        case product
    }
}
