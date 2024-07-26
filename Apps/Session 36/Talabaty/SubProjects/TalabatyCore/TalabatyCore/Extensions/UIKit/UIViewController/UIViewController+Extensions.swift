//
//  UIViewController+Extensions.swift
//  TalabatyCore
//
//  Created by Mohamed Elbana on 07/05/2024.
//

import UIKit

public extension UIViewController {
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it!", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
