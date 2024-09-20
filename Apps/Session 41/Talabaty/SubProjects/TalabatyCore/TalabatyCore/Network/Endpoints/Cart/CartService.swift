//
//  CartService.swift
//  TalabatyCore
//
//  Created by Mohamed Elbana on 20/09/2024.
//

import Foundation

public protocol CartServiceProtocol {
    func get(completion: @escaping (APIResponse<Page<Cart>>) -> ())
    func add(form: CartForm,
             completion: @escaping (APIResponse<Page<Cart>>) -> ())
}

public class CartService: CartServiceProtocol {
    
    public init() {
        
    }
    
    public func get(completion: @escaping (APIResponse<Page<Cart>>) -> ()) {
        let endpint = Endpoint(
            path: Constants.EndpointPath.carts,
            method: .get)
        NetworkManager().request(type: Page<Cart>.self,
                                 of: endpint,
                                 completion: completion)
    }
    
    public func add(form: CartForm,
                    completion: @escaping (APIResponse<Page<Cart>>) -> ()) {
        let endpint = Endpoint(
            path: Constants.EndpointPath.carts,
            method: .post,
            body: form)
        NetworkManager().request(type: Page<Cart>.self,
                                 of: endpint,
                                 completion: completion)
    }
}
