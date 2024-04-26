//
//  CategoriesRepo.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 11/03/2024.
//

import Foundation

public class CategoriesRepo {
    
    private let service: CategoriesServiceProtocol
    
    public init(service: CategoriesServiceProtocol = CategoriesService()) {
        self.service = service
    }
    
    public func getAll(pageNumber: Int = 1,
                completion: @escaping (APIResponse<Page<Category>>) -> ()) {
        // First, check if data exist local
        service.getAll(pageNumber: pageNumber, completion: completion)
    }
    
    public func getAll(id: String,
                completion: @escaping (APIResponse<Category>) -> ()) {
        service.getOne(id: id, completion: completion)
    }
}
