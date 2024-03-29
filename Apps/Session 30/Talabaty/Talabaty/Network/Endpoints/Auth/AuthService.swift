//
//  AuthService.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 29/03/2024.
//

import Foundation

protocol AuthServiceProtocol {
    func login(form: LoginForm,
               completion: @escaping (APIResponse<LoginResponse>) -> ())
}

class AuthService: AuthServiceProtocol {
    
    func login(form: LoginForm,
               completion: @escaping (APIResponse<LoginResponse>) -> ()) {
        let endpint = Endpoint(
            path: Constants.EndpointPath.login,
            method: .post,
            body: form)
        NetworkManager().request(type: LoginResponse.self,
                                 of: endpint,
                                 completion: completion)
    }
}
