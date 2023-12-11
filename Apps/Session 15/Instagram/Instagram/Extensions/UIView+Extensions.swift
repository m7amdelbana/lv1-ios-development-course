//
//  UIView+Extensions.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 21/10/2023.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            UIColor(cgColor: self.layer.borderColor ?? UIColor.clear.cgColor)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var isRounded: Bool {
        get {
            self.bounds.height == self.layer.cornerRadius * 2
        }
        set {
            if newValue {
                self.layer.cornerRadius = self.bounds.height / 2
            }
        }
    }
    
    func setCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func setShadow(color: UIColor,
                   opacity: Float = 0.1,
                   offset: CGSize) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
    }
    
    @discardableResult
    func loadFromNib<T: UIView>() -> T? {
        let name = "\(type(of: self))"
        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(name, owner: self)?.first as? T else {
            return nil
        }
        
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.fillView(to: self)
        return contentView
    }
    
    func fillView(to parentView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        parentView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        parentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        parentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        parentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
