//
//  APIError.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 01/03/2024.
//

import Foundation

public struct APIError {
    
    public let code: Int
    public let message: String
    
    init(_ code: Int, _ message: String) {
        self.code = code
        self.message = message
    }
}
