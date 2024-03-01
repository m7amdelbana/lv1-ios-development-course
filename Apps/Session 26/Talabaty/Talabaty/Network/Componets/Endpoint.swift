//
//  Endpoint.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 23/02/2024.
//

import Foundation

struct Endpoint {
    
    let path: String
    let method: HTTPMethod
    let headers: [String:String]?
    let body: Any?
    
    init(path: String,
         method: HTTPMethod,
         headers: [String:String]? = nil,
         body: Any? = nil) {
        self.path = path
        self.method = method
        self.headers = headers
        self.body = body
    }
}
