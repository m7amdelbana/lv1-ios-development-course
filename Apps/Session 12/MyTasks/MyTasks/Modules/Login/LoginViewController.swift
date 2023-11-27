//
//  LoginViewController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 31/10/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: AppTextField!
    @IBOutlet weak var passwordTextField: AppTextField!
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        guard !username.isEmpty, !password.isEmpty else {
            print("Complete information")
            return
        }
        
        let savedUsername = defaults.string(forKey: "USERNAME") ?? ""
        let savedPassword = defaults.string(forKey: "PASSWORD") ?? ""
        
        if username != savedUsername {
            print("Wrong username")
            return
        }
        
        if password != savedPassword {
            print("Wrong password")
            return
        }
        
        UserDefaults.standard.set(true, forKey: "IS_USER_LOGIN")
        goToHome()
    }
    
    private func goToHome() {
        let vc = HomeViewController()
        let nav = UINavigationController(rootViewController: vc)
        RootRouter.presentRootScreen(with: nav)
    }
}
