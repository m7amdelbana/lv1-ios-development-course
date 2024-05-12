//
//  AppCategory.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 19/02/2024.
//

import Foundation

public struct AppCategory: Codable {
    
    public let id: String?
    public let image: String?
    public let featured: Bool?
    public let name: String?
    
    public var imageUrl: URL? {
        return URL(string: image ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case image
        case featured
        case name
    }
}
