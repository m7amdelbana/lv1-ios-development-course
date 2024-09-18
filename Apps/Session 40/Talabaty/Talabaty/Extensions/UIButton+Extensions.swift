//
//  UIButton+Extensions.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 15/05/2024.
//

import UIKit

public extension UIButton {
    
    @IBInspectable
    var localizedText: String {
        set { setTitle(newValue.localized, for: .normal) }
        get { titleLabel?.text ?? "" }
    }
}
