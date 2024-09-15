//
//  ProductsService.swift
//  TalabatyCore
//
//  Created by Mohamed Elbana on 15/09/2024.
//

import Foundation

public protocol ProductsServiceProtocol {
    func get(categoryId: String,
             pageNumber: Int,
             pageSize: Int,
             completion: @escaping (APIResponse<Page<Product>>) -> ())
}

public class ProductsService: ProductsServiceProtocol {
    
    public init() {
        
    }
    
    public func get(categoryId: String,
                    pageNumber: Int,
                    pageSize: Int,
                    completion: @escaping (APIResponse<Page<Product>>) -> ()) {
        let endpint = Endpoint(
            path: Constants.EndpointPath.products,
            method: .get,
            paramters: [
                Constants.EndpointKeys.categoryId.rawValue : categoryId,
                Constants.EndpointKeys.pageNumber.rawValue : pageNumber,
                Constants.EndpointKeys.pageSize.rawValue : pageSize,
            ])
        NetworkManager().request(type: Page<Product>.self,
                                 of: endpint,
                                 completion: completion)
    }
}
