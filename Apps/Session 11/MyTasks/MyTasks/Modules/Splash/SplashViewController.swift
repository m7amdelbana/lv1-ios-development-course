//
//  SplashViewController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 20/10/2023.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.presentIntroduction()
        }
    }
    
    private func presentIntroduction() {
        let vc = IntroductionViewController()
        let nav = UINavigationController(rootViewController: vc)
        RootRouter.presentRootScreen(with: nav)
    }
}
