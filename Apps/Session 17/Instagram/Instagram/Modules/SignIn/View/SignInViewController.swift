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
    
    @IBOutlet weak var facebookBotton: UIButton!
    @IBOutlet weak var googleBotton: UIButton!
    
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
        facebookBotton.setTitle("Continue with Facebook", for: .normal)
        googleBotton.setTitle("Continue with Google", for: .normal)
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

extension SignInViewController: SignInViewControllerProtocol {
    
    func didSignedUser() {
        navigateToHome()
    }
}
