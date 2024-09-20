//
//  CartHandler.swift
//  TalabatyCore
//
//  Created by Mohamed Elbana on 20/09/2024.
//

import Foundation

public class CartHandler {
    
    public static let shared = CartHandler()
    public var carts = [Cart]()
    
    private let cartRepo = CartRepo()
    
    public func getCarts(completion: @escaping (APIResponse<Page<Cart>>) -> ()) {
        cartRepo.get() { [weak self] response in
            guard let self else { return }
            DispatchQueue.main.async {
                switch response {
                case let .onSuccess(result):
                    self.carts = result.data ?? []
                    completion(.onSuccess(result))
                case let .onFailure(error):
                    completion(.onFailure(error))
                }
            }
        }
    }
    
    public func addToCart(
        _ form: CartForm,
        completion: @escaping (APIResponse<Page<Cart>>) -> ()) {
            cartRepo.add(form: form) { [weak self] response in
                guard let self else { return }
                DispatchQueue.main.async {
                    switch response {
                    case let .onSuccess(result):
                        self.carts = result.data ?? []
                        completion(.onSuccess(result))
                    case let .onFailure(error):
                        completion(.onFailure(error))
                    }
                }
            }
        }
}
