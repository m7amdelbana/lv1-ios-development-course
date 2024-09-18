//
//  Constants.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 23/02/2024.
//

import Foundation

public class Constants {
    
    enum API {
        static let baseUrl = "http://talabaty-1c6983cf0e45.herokuapp.com/api/"
        static let timeoutInterval = 40.0
        static let pageSize = 30
    }
    
    enum EndpointPath {
        
        // MARK: - AUTH
        
        static let login = "auth/users/login"
        static let me = "auth/users/me"
        
        // MARK: - CATAGORIES
        
        static let categories = "components/categories"
        
        // MARK: - ADS
        
        static let ads = "components/ads"
        
        // MARK: - PRODUCTS
        
        static let products = "components/products"
    }
    
    enum EndpointKeys: String {
        case pageNumber = "pageNumber"
        case pageSize = "pageSize"
        case state = "state"
        case categoryId = "categoryId"
    }
}
