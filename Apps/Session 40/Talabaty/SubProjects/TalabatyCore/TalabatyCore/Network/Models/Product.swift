//
//  Product.swift
//  TalabatyCore
//
//  Created by Mohamed Elbana on 15/09/2024.
//

import Foundation

public struct Product: Codable {
    
    public let id: String?
    public let image: String?
    public let featured: Bool?
    public let name: String?
    public let desc: String?
    public let priceAfterDiscount: Double?
    public let price: Double?
    public let categoryId: String?
    public let category: AppCategory?
    public let inventory: Int?
    
    public var imageUrl: URL? {
        return URL(string: image ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case image
        case featured
        case name
        case desc = "description"
        case priceAfterDiscount
        case price
        case categoryId
        case category
        case inventory
    }
}
