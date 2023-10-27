//
//  IntroductionViewController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 17/10/2023.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBOutlet weak var createAccountButton: UIButton!
    let number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAccountButton.cornerRadius(25)
        
        // let z = calculate(i: Int.random(in: 10...100))
        // print("Z: \(z)")
        
        // let x = 10 / number
        // print("X: \(x)")
    }
    
    @IBAction func actions(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            print("Action: Create Account")
        case 2:
            print("Action: Login")
        default:
            break
        }
        
        navigateToHome()
    }
    
    private func navigateToHome() {
        let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as? HomeViewController
        if let vc {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
    
    private func calculate(i: Int) -> Int {
        let x = i * 2
        let y = x * 3
        let z = x * 4
        return z
    }
}

