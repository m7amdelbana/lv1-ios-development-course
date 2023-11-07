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
    @IBOutlet weak var password: AppTextField!
    
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
        let vc = HomeViewController()
        let nav = UINavigationController(rootViewController: vc)
        RootRouter.presentRootScreen(with: nav)
    }
}
