//
//  PrimaryButton.swift
//  TalabatyUI
//
//  Created by Mohamed Elbana on 15/05/2024.
//

import UIKit

public class PrimaryButton: UIButton {
    
    private let bundle = Bundle(identifier: "com.m7amdelbana.TalabatyUI")!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        // Corner radius
        layer.cornerRadius = 5
        clipsToBounds = true
        
        // Gradient
        backgroundColor = nil
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            UIColor(
                named: "primary",
                in: bundle,
                compatibleWith: nil)?.cgColor ?? UIColor.clear.cgColor,
            UIColor(
                named: "primary-dark",
                in: bundle,
                compatibleWith: nil)?.cgColor ?? UIColor.clear.cgColor
        ]
        /// gradient.locations
        gradient.startPoint = .init(x: 0, y: 0)
        gradient.endPoint = .init(x: 1, y: 1)
        layer.insertSublayer(gradient, at: 0)
        
        layoutIfNeeded()
        layoutSubviews()
    }
}
