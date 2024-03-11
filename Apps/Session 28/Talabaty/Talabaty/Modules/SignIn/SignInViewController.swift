//
//  SignInViewController.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 11/03/2024.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.font = UIFont(name: "Poppins-Bold", size: 17)!
        label.font = UIFont.systemFont(ofSize: 17)
    }
}
