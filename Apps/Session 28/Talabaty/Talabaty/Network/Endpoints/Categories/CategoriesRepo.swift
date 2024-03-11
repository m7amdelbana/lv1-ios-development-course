//
//  CategoriesRepo.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 11/03/2024.
//

import Foundation

class CategoriesRepo {
    
    private let service: CategoriesServiceProtocol
    
    init(service: CategoriesServiceProtocol = CategoriesService()) {
        self.service = service
    }
    
    func getAll(pageNumber: Int = 1,
                completion: @escaping (APIResponse<Page<Category>>) -> ()) {
        // First, check if data exist local
        service.getAll(pageNumber: pageNumber, completion: completion)
    }
}
