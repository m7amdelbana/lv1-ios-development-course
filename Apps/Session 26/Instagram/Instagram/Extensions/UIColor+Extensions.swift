//
//  UIColor+Extensions.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 27/10/2023.
//

import UIKit

enum AppColor: String {
    
    case primaryColor = "PrimaryColor"
    case accent = "Accent"
    case secondary = "Secondary"
    case tertairy = "Tertairy"
    case border = "Border"
    case backgroundColor = "BackgroundColor"
}

extension UIColor {
    
    static let primaryColor = UIColor(name: .primaryColor)
    static let border = UIColor(name: .border)
    static let backgroundColor = UIColor(name: .backgroundColor)
    
    convenience init?(name: AppColor) {
        self.init(named: name.rawValue)
    }
    
    convenience init(r red: Int, g green: Int, b blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }
    
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(r: (hex >> 16) & 0xFF, g: (hex >> 8) & 0xFF, b: hex & 0xFF, a: a)
    }
}
