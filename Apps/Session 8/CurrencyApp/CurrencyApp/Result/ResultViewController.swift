//
//  ResultViewController.swift
//  CurrencyApp
//
//  Created by Mohamed Elbana on 20/10/2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var converedAmountLabel: UILabel!
    
    var amount: String
    
    init(amount: String) {
        self.amount = amount
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Result"
        
        guard !amount.isEmpty else {
            converedAmountLabel.text = "Enter EGP amount"
            converedAmountLabel.textColor = .systemOrange
            return
        }
        
        guard let egpAmount = Double(amount) else {
            converedAmountLabel.text = "Enter correct EGP amount"
            converedAmountLabel.textColor = .systemRed
            return
        }
        
        let usdAmount = egpAmount / 30.5
        converedAmountLabel.text = "\(usdAmount) USD"
        converedAmountLabel.textColor = .systemGreen
    }
    
    @IBAction func actionClose(_ sender: Any) {
        // dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
}


