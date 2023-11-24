//
//  CreateAccountViewController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 31/10/2023.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: AppTextField!
    @IBOutlet weak var usernameTextField: AppTextField!
    @IBOutlet weak var passwordTextField: AppTextField!
    
    // MARK: Singleton
    // static let standard = CreateAccountViewController()
    // let vc = CreateAccountViewController.standard
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Create account"
    }
    
    @IBAction func actionCreateAccount(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        guard !name.isEmpty, !username.isEmpty, !password.isEmpty else {
            print("Complete information")
            return
        }
        
        // Save data
        saveData(name: name, username: username, password: password)
        
        // Navigate
        goToHome()
    }
    
    private func saveData(name: String, username: String, password: String) {
        
        // MARK: Search about how to save object conatins those data
        // How to save objects at UserDefaults?
        
        UserDefaults.standard.set(true, forKey: "IS_USER_LOGIN")
        UserDefaults.standard.set(name, forKey: "NAME")
        UserDefaults.standard.set(username, forKey: "USERNAME")
        UserDefaults.standard.set(password, forKey: "PASSWORD")
        
        // MARK: ...
        
        // Refresh data
        UserDefaults.standard.synchronize()
    }
    
    private func goToHome() {
        let vc = HomeViewController()
        let nav = UINavigationController(rootViewController: vc)
        RootRouter.presentRootScreen(with: nav)
    }
}
