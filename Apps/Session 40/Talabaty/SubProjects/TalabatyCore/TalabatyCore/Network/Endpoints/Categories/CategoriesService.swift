//
//  CategoriesService.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 11/03/2024.
//

import Foundation

public protocol CategoriesServiceProtocol {
    func getAll(state: String,
                completion: @escaping (APIResponse<Page<AppCategory>>) -> ())
    func getOne(id: String,
                completion: @escaping (APIResponse<AppCategory>) -> ())
}

public class CategoriesService: CategoriesServiceProtocol {
    
    public init() {
        
    }
    
    public func getAll(state: String,
                       completion: @escaping (APIResponse<Page<AppCategory>>) -> ()) {
        let endpint = Endpoint(
            path: Constants.EndpointPath.categories,
            method: .get,
            paramters: [
                Constants.EndpointKeys.state.rawValue : state,
            ])
        NetworkManager().request(type: Page<AppCategory>.self,
                                 of: endpint,
                                 completion: completion)
    }
    
    public func getOne(id: String,
                       completion: @escaping (APIResponse<AppCategory>) -> ()) {
        let endpint = Endpoint(
            path: "\(Constants.EndpointPath.categories)/mobile/\(id)",
            method: .get)
        NetworkManager().request(type: AppCategory.self,
                                 of: endpint,
                                 completion: completion)
    }
}
