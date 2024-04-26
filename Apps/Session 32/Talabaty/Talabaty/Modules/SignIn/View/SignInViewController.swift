//
//  SignInViewController.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 11/03/2024.
//

import UIKit
import RxSwift

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let viewModel: SignInViewModel
    private let disposeBag = DisposeBag()
    
    init() {
        self.viewModel = SignInViewModel()
        super.init(nibName: String(describing: Self.self),
                   bundle: .init(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe()
    }
    
    private func subscribe() {
        viewModel.screenState.subscribe(onNext: { element in
            switch element {
            case .showLoading:
                print("Show Loading")
            case .hideLoading:
                print("Hide Loading")
            case .didSuccessLogin:
                print("Did Success")
            case let .didFailedLogin(errorMessaage):
                print("Did Failed: \(errorMessaage)")
            }
        }).disposed(by: disposeBag)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let email = emailAddressTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        viewModel.login(email: email, password: password)
    }
    
    @IBAction func forgetPasswordAction(_ sender: Any) {
        
    }
}
