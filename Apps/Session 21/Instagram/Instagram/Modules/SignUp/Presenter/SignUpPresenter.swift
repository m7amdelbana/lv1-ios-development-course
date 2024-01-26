//
//  SignUpPresenter.swift
//  Instagram
//
//  Created by Mohamed Elbana on 19/01/2024.
//

import UIKit

protocol SignUpPresenterProtocol {
    func viewDidLoad()
    func didPressedGoogle(in view: UIViewController)
}

class SignUpPresenter: NSObject {
    
    private var repo: AuthRepo
    private var delegate: SignUpViewControllerProtocol?
    
    init(delegate: SignUpViewControllerProtocol?) {
        self.delegate = delegate
        repo = AuthRepo()
    }
}

// MARK: - [View] -> [Presenter]

extension SignUpPresenter: SignUpPresenterProtocol {

    func viewDidLoad() {
        
    }
    
    func didPressedGoogle(in view: UIViewController) {
        repo.signInWithGoogle(in: view) {
            self.delegate?.didSignedUser()
        }
    }
}
