//
//  MainViewController.swift
//  CurrencyApp
//
//  Created by Mohamed Elbana on 13/10/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var amountTextFiled: UITextField!
    @IBOutlet weak var convetedAmountLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Main"
    }
    
    @IBAction func actionConvert(_ sender: UIButton) {
        let amount: String = amountTextFiled.text ?? ""
        
        navigateToResult(amount: amount)
        
        guard !amount.isEmpty else {
            convetedAmountLabel.text = "Enter EGP amount"
            convetedAmountLabel.textColor = .systemOrange
            return
        }
        
        guard let egpAmount = Double(amount) else {
            convetedAmountLabel.text = "Enter correct EGP amount"
            convetedAmountLabel.textColor = .systemRed
            return
        }
        
        let usdAmount = egpAmount / 30.5
        convetedAmountLabel.text = "\(usdAmount) USD"
        convetedAmountLabel.textColor = .systemGreen
    }
    
    private func presentResult(amount: String) {
        let vc = ResultViewController(amount: amount)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    private func navigateToResult(amount: String) {
        let vc = ResultViewController(amount: amount)
        navigationController?.pushViewController(vc, animated: true)
    }
}

