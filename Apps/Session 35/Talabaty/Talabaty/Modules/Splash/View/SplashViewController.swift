//
//  SplashViewController.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 19/02/2024.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let viewModel = SplashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if UserDefaults().getBoolean(key: .isUserShowOnboading) == true {
                self.navigateToIntro()
            } else {
                self.navigateToOnboading()
            }
        }
    }
    
    private func navigateToSignIn() {
        let vc = SignInViewController()
        let nav = UINavigationController(rootViewController: vc)
        RootRouter.presentRootScreen(with: nav)
    }
    
    private func navigateToIntro() {
        let vc = IntroViewController()
        RootRouter.presentRootScreen(with: vc)
    }
    
    private func navigateToOnboading() {
        let vc = OnboardingViewController()
        RootRouter.presentRootScreen(with: vc)
    }
}

