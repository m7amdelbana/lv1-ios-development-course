//
//  Constants.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 23/02/2024.
//

import Foundation

class Constants {
    
    enum API {
        static let baseUrl = "http://198.211.101.142:8079/api/"
        static let timeoutInterval = 40.0
        static let pageSize = 30
    }
    
    enum EndpointPath {
        
        // MARK: - AUTH
        
        static let login = "auth/users/login/email"
        
        // MARK: - CATAGORIES
        
        static let categories = "components/categories"
        
        // MARK: - ADS
        
        static let ads = "components/ads"
    }
    
    enum EndpointKeys: String {
        case pageNumber = "pageNumber"
        case pageSize = "pageSize"
    }
}
