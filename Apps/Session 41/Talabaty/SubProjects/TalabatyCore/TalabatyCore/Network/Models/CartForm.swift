//
//  CartForm.swift
//  TalabatyCore
//
//  Created by Mohamed Elbana on 20/09/2024.
//

import Foundation

public struct CartForm: Codable {

    public let productId: String
    public let quantity: Int
    
    public init(productId: String, quantity: Int) {
        self.productId = productId
        self.quantity = quantity
    }
}
