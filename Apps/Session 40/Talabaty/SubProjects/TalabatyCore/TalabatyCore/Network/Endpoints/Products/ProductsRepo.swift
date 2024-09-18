//
//  ProductsRepo.swift
//  TalabatyCore
//
//  Created by Mohamed Elbana on 15/09/2024.
//

import Foundation

public class ProductsRepo {
    
    private let service: ProductsServiceProtocol
    
    public init(service: ProductsServiceProtocol = ProductsService()) {
        self.service = service
    }
    
    public func get(
        categoryId: String,
        pageNumber: Int,
        pageSize: Int,
        completion: @escaping (APIResponse<Page<Product>>) -> ()) {
            service.get(categoryId: categoryId,
                        pageNumber: pageNumber,
                        pageSize: pageSize,
                        completion: completion)
        }
}
