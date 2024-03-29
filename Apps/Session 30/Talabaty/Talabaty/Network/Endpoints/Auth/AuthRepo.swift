//
//  AuthRepo.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 29/03/2024.
//

import Foundation

class AuthRepo {
    
    private let service: AuthServiceProtocol
    
    init(service: AuthServiceProtocol = AuthService()) {
        self.service = service
    }
    
    func login(form: LoginForm,
               completion: @escaping (APIResponse<LoginResponse>) -> ()) {
        service.login(form: form) { response in
            switch response {
            case let .onSuccess(result):
                // Save access token in UserDefaults
                completion(.onSuccess(result))
            case let .onFailure(error):
                completion(.onFailure(error))
            }
        }
    }
}
