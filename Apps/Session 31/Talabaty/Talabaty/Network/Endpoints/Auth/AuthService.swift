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
    func me(completion: @escaping (APIResponse<User>) -> ())
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
    
    func me(completion: @escaping (APIResponse<User>) -> ()) {
        let endpint = Endpoint(
            path: Constants.EndpointPath.me,
            method: .get)
        NetworkManager().request(type: User.self,
                                 of: endpint,
                                 completion: completion)
    }
}
