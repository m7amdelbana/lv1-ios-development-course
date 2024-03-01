//
//  SignUpViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 15/12/2023.
//

import UIKit

protocol SignUpViewControllerProtocol {
    func didSignedUser()
}

class SignUpViewController: UIViewController {
    
    private var presenter: SignUpPresenterProtocol?
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
        presenter = SignUpPresenter(delegate: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Sign up"
    }
    
    @IBAction func didPressedFacebook(_ sender: Any) {
        
    }
    
    @IBAction func didPressedGoogle(_ sender: Any) {
        presenter?.didPressedGoogle(in: self)
    }
    
    private func navigateToHome() {
        let tabBar = AppTabBarController()
        RootRouter.presentRootScreen(with: tabBar)
    }
}

// MARK: - [Presenter] -> [View]

extension SignUpViewController: SignUpViewControllerProtocol {
    
    func didSignedUser() {
        navigateToHome()
    }
}
