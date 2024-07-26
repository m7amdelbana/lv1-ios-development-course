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
    
    public func getAll(completion: @escaping (APIResponse<Page<AppCategory>>) -> ()) {
        service.getAll(state: "active", completion: completion)
    }
    
    public func getOne(id: String,
                       completion: @escaping (APIResponse<AppCategory>) -> ()) {
        service.getOne(id: id, completion: completion)
    }
}
