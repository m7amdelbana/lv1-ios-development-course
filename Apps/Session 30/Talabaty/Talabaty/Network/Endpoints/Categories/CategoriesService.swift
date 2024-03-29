//
//  CategoriesService.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 11/03/2024.
//

import Foundation

protocol CategoriesServiceProtocol {
    func getAll(pageNumber: Int,
                completion: @escaping (APIResponse<Page<Category>>) -> ())
    func getOne(id: String,
                completion: @escaping (APIResponse<Category>) -> ())
}

class CategoriesService: CategoriesServiceProtocol {
    
    func getAll(pageNumber: Int,
                completion: @escaping (APIResponse<Page<Category>>) -> ()) {
        let endpint = Endpoint(
            path: Constants.EndpointPath.categories,
            method: .get,
            paramters: [
                Constants.EndpointKeys.pageNumber.rawValue : pageNumber,
                Constants.EndpointKeys.pageSize.rawValue: Constants.API.pageSize
            ])
        NetworkManager().request(type: Page<Category>.self,
                                 of: endpint,
                                 completion: completion)
    }
    
    func getOne(id: String,
                completion: @escaping (APIResponse<Category>) -> ()) {
        let endpint = Endpoint(
            path: "\(Constants.EndpointPath.categories)/\(id)",
            method: .get)
        NetworkManager().request(type: Category.self,
                                 of: endpint,
                                 completion: completion)
    }
}
