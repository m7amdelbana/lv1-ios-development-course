//
//  String+Extensions.swift
//  Instagram
//
//  Created by Mohamed Elbana on 19/01/2024.
//

import UIKit

extension String {
    
    var localized: String {
        return Bundle.main.localizedString(forKey: self, value: "", table: nil)
    }
    
    func getLocalized(_ key: String...) -> String {
        return String.init(format: self.localized, arguments: key)
    }
}

extension UILabel {
    
    @IBInspectable
    var localized: String {
        set { self.text = newValue.localized }
        get { return text ?? "" }
    }
}

extension UIButton {
    
    @IBInspectable
    var localized: String {
        set { self.setTitle(newValue.localized, for: .normal) }
        get { return titleLabel?.text ?? "" }
    }
}
