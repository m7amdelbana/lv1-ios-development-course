//
//  SignUpViewController.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 16/07/2024.
//

import UIKit
import TalabatyUI
import TalabatyCore

class SignUpViewController: UIViewController {

    @IBOutlet weak var fullNameTextField: AppTextField!
    @IBOutlet weak var emailTextField: AppTextField!
    @IBOutlet weak var phoneTextField: AppTextField!
    @IBOutlet weak var passwordTextField: AppTextField!
    @IBOutlet weak var signUpButton: PrimaryButton!
    
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
    
    private func validateInputs() -> Bool {
        let fullName = fullNameTextField.text?.trim() ?? ""
        let email = emailTextField.text?.trim() ?? ""
        let phone = phoneTextField.text?.trim() ?? ""
        let password = passwordTextField.text?.trim() ?? ""
        
        if fullName.isEmpty {
            showError(with: "Enter full name")
            return false
        } else if email.isEmpty {
            showError(with: "Enter email")
            return false
        } else if !Validator.isValidEmail(email) {
            showError(with: "Enter valid email")
            return false
        } else if phone.isEmpty {
            showError(with: "Enter phone")
            return false
        } else if !Validator.isValidPhone(phone) {
            showError(with: "Enter valid phone")
            return false
        } else if password.isEmpty {
            showError(with: "Enter password")
            return false
        } else if password.count < 8 {
            showError(with: "Password should be minimum 8 characters")
            return false
        } else {
            return true
        }
    }
    
    private func showError(with message: String) {
        InfoBanner.shared.showInputError(with: message)
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        if validateInputs() {
            // Sign up
        }
    }
}
