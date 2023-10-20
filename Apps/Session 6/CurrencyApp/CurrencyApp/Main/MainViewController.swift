//
//  MainViewController.swift
//  CurrencyApp
//
//  Created by Mohamed Elbana on 13/10/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var amountTextFiled: UITextField!
    @IBOutlet weak var converedAmountLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    @IBAction func actionConvert(_ sender: UIButton) {
        /*
        let amount: String = amountTextFiled.text ?? ""
        if !amount.isEmpty {
            let usdAmount = (Double(amount) ?? 0.0) * 30.5
            converedAmountLabel.text = "\(usdAmount) USD"
        }
        */
        
        guard let amount = amountTextFiled.text,
              !amount.isEmpty else {
            converedAmountLabel.text = "Enter EGP amount"
            converedAmountLabel.textColor = .systemOrange
            return
        }
        
        guard let egpAmount = Double(amount) else {
            converedAmountLabel.text = "Enter correct EGP amount"
            converedAmountLabel.textColor = .systemRed
            return
        }
        
        let usdAmount = egpAmount * 30.5
        converedAmountLabel.text = "\(usdAmount) USD"
        converedAmountLabel.textColor = .systemGreen
    }
}

