//
//  SignInPresenter.swift
//  Instagram
//
//  Created by Mohamed Elbana on 22/12/2023.
//

import UIKit

protocol SignInPresenterProtocol {
    func viewDidLoad()
    func didPressedGoogle(in view: UIViewController)
}

class SignInPresenter: NSObject {
    
    private var repo: AuthRepo
    private var delegate: SignInViewControllerProtocol?
    
    init(delegate: SignInViewControllerProtocol?) {
        self.delegate = delegate
        repo = AuthRepo()
    }
}

// MARK: - [View] -> [Presenter]

extension SignInPresenter: SignInPresenterProtocol {

    func viewDidLoad() {
        
    }
    
    func didPressedGoogle(in view: UIViewController) {
        repo.signInWithGoogle(in: view) {
            self.delegate?.didSignedUser()
        }
    }
}
