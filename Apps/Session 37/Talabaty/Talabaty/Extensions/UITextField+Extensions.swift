//
//  UITextField+Extensions.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 26/07/2024.
//

import UIKit

public extension UITextField {
    
    @IBInspectable
    var localizedText: String {
        set { text = newValue.localized }
        get { text ?? "" }
    }
    
    @IBInspectable
    var localizedPlaceholder: String {
        set { placeholder = newValue.localized }
        get { placeholder ?? "" }
    }
}
