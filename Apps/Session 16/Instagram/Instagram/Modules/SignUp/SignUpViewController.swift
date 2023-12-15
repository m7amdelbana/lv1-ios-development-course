//
//  SignUpViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 15/12/2023.
//

import UIKit

class SignUpViewController: UIViewController {
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Sign up"
    }
}
