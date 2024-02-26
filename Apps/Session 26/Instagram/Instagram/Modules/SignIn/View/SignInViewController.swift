//
//  SignInViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 15/12/2023.
//

import UIKit

protocol SignInViewControllerProtocol {
    func didSignedUser()
}

class SignInViewController: UIViewController {
    
    // @IBOutlet weak var messageLabel: UILabel!
    // @IBOutlet weak var facebookBotton: UIButton!
    // @IBOutlet weak var googleBotton: UIButton!
    
    private var presenter: SignInPresenterProtocol?
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
        presenter = SignInPresenter(delegate: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        presenter = SignInPresenter(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        /// messageLabel.text = "SignIn.mesaage".localized
        /// facebookBotton.setTitle("SignIn.continue_with_facebook".localized,for: .normal)
        /// googleBotton.setTitle("SignIn.continue_with_google".localized,for: .normal)
    }
    
    @IBAction func didPressedFacebook(_ sender: Any) {
        
    }
    
    @IBAction func didPressedGoogle(_ sender: Any) {
        presenter?.didPressedGoogle(in: self)
    }
    
    @IBAction func didPressedSignUp(_ sender: Any) {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func navigateToHome() {
        let tabBar = AppTabBarController()
        RootRouter.presentRootScreen(with: tabBar)
    }
}

// MARK: - [Presenter] -> [View]

extension SignInViewController: SignInViewControllerProtocol {
    
    func didSignedUser() {
        navigateToHome()
    }
}
