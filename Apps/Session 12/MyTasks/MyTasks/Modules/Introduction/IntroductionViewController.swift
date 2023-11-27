//
//  IntroductionViewController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 17/10/2023.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAccountButton.setCornerRadius(25)
    }
    
    @IBAction func actions(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            let vc = CreateAccountViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = LoginViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
