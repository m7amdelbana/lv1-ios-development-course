//
//  SignInViewModel.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 29/03/2024.
//

import Foundation
import RxSwift
import TalabatyCore

enum SignInState {
    case showLoading
    case hideLoading
    case didSuccessLogin
    case didFailedLogin(errorMessaage: String)
}

class SignInViewModel {
    
    let screenState = PublishSubject<SignInState>()
    private let repo = AuthRepo()
    
    func login(email: String, password: String) {
        screenState.on(.next(.showLoading))
        let form = LoginForm(emailAddress: email, password: password)
        repo.login(form: form) { response in
            self.screenState.on(.next(.hideLoading))
            switch response {
            case .onSuccess:
                self.getUser()
                self.screenState.on(.next(.didSuccessLogin))
            case let .onFailure(error):
                self.screenState.on(.next(.didFailedLogin(errorMessaage: error.message)))
            }
        }
    }
    
    func getUser() {
        repo.me { response in
            switch response {
            case let .onSuccess(user):
                print(user)
            case let .onFailure(error):
                print(error)
            }
        }
    }
}
