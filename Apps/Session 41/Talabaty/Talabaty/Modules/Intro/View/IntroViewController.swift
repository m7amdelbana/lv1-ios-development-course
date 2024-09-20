//
//  IntroViewController.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 15/05/2024.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var bottomContainerView: UIView!
    
    init() {
        super.init(nibName: .init(describing: Self.self),
                   bundle: .init(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        let vc = SignInViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
