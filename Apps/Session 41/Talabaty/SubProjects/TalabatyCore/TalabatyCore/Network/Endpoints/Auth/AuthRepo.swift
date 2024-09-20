//
//  AuthRepo.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 29/03/2024.
//

import Foundation

public class AuthRepo {
    
    private let service: AuthServiceProtocol
    
    public init(service: AuthServiceProtocol = AuthService()) {
        self.service = service
    }
    
    public func login(form: LoginForm,
               completion: @escaping (APIResponse<LoginResponse>) -> ()) {
        service.login(form: form) { response in
            switch response {
            case let .onSuccess(result):
                if let xAuthToken = result.xAuthToken,
                    !xAuthToken.isEmpty {
                    LocalUserManager.shared.setToken(xAuthToken)
                }
                completion(.onSuccess(result))
            case let .onFailure(error):
                completion(.onFailure(error))
            }
        }
    }
    
    public func me(completion: @escaping (APIResponse<User>) -> ()) {
        service.me(completion: completion)
    }
}
