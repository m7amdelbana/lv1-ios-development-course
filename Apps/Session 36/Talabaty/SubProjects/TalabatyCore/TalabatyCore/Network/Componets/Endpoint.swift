//
//  Endpoint.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 23/02/2024.
//

import Foundation

typealias APIHeaders = [String:String]
typealias APIParamters = [String:Any]

struct Endpoint {
    
    let path: String
    let method: HTTPMethod
    let headers: APIHeaders?
    let paramters: APIParamters?
    let body: Any?
    
    init(path: String,
         method: HTTPMethod,
         headers: [String:String]? = nil,
         paramters: APIParamters? = nil,
         body: Any? = nil) {
        self.path = path
        self.method = method
        self.headers = headers
        self.paramters = paramters
        self.body = body
    }
}
