//
//  SplashViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 04/12/2023.
//

import UIKit

class SplashViewController: UIViewController {
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.presentHome()
        }
    }
    
    private func presentHome() {
        let vc = HomeViewController()
        // let nav = AppNavController(rootViewController: vc)
        // RootRouter.presentRootScreen(with: nav)
        
        let tab = AppTabBarController()
        RootRouter.presentRootScreen(with: tab)
    }
}
