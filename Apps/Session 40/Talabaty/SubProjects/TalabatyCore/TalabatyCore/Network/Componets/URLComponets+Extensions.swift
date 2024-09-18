//
//  URLComponets+Extensions.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 01/03/2024.
//

import Foundation

extension URLComponents {
    
    init(_ endpoint: Endpoint) {
        let baseUrlString = Constants.API.baseUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        let baseUrl = URL(string: baseUrlString)
        
        let fullUrl = baseUrl!.appendingPathComponent(endpoint.path)
        
        self.init(url: fullUrl, resolvingAgainstBaseURL: false)!
        
        guard let paramters = endpoint.paramters else { return }
        
        queryItems = paramters.map { key, value in
            return URLQueryItem(name: key, 
                                value: String(describing: value))
        }
    }
}
