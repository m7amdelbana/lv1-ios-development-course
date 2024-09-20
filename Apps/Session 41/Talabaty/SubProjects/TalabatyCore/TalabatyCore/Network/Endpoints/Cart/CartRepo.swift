//
//  CartRepo.swift
//  TalabatyCore
//
//  Created by Mohamed Elbana on 20/09/2024.
//

import Foundation

public class CartRepo {
    
    private let service: CartServiceProtocol
    
    public init(service: CartServiceProtocol = CartService()) {
        self.service = service
    }
    
    public func get(completion: @escaping (APIResponse<Page<Cart>>) -> ()) {
        service.get(completion: completion)
    }
    
    public func add(form: CartForm,
                    completion: @escaping (APIResponse<Page<Cart>>) -> ()) {
        service.add(form: form, completion: completion)
    }
}
