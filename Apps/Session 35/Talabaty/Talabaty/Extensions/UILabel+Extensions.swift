//
//  UILabel+Extensions.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 10/05/2024.
//

import UIKit

public extension UILabel {
    
    @IBInspectable
    var localizedText: String {
        set { self.text = newValue.localized }
        get { return self.text ?? "" }
    }
}

/*
public extension UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        let fontName = UIFont().setCustomFont(font.fontName)
        font = .init(name: fontName, size: font.pointSize)
    }
}
*/

/*
 public extension UIButton {
 
 override func awakeFromNib() {
 super.awakeFromNib()
 setupUI()
 }
 
 private func setupUI() {
 let fontName = UIFont().setCustomFont(titleLabel?.font.fontName ?? "")
 titleLabel?.font = .init(name: fontName,
 size: titleLabel?.font.pointSize ?? 18.0 )
 }
 }
*/
