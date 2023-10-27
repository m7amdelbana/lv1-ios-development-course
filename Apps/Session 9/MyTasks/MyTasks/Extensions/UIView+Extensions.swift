//
//  UIView+Extensions.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 21/10/2023.
//

import UIKit

extension UIView {
    
    func cornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func setShadow(color: UIColor,
                   opacity: Float = 0.1,
                   offset: CGSize) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
    }
}
