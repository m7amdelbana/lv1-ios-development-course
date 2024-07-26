//
//  SignUpViewController.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 16/07/2024.
//

import UIKit

class SignUpViewController: UIViewController {

    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: .init(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SignUp.sign_up".localized
    }
}
