//
//  APIError.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 01/03/2024.
//

import Foundation

struct APIError {
    
    let code: Int
    let message: String
    
    init(_ code: Int, _ message: String) {
        self.code = code
        self.message = message
    }
}
