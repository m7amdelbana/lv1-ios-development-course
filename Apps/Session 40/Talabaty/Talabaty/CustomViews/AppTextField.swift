//
//  AppTextField.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 26/07/2024.
//

import UIKit

@IBDesignable
class AppTextField: UITextField {
    
    @IBInspectable
    var iconImage: UIImage? {
        didSet {
            setIconImage()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        borderStyle = .none
        layer.cornerRadius = 5
        backgroundColor = .white
    }
    
    private func setIconImage() {
        if let image = iconImage {
            leftViewMode = .always
            
            let containerFrame = CGRect(x: 0, y: 0, width: 60, height: 40)
            let imageFrame = CGRect(x: 20, y: 8, width: 24, height: 24)
            
            let containerView = UIView(frame: containerFrame)
            let imageView = UIImageView(frame: imageFrame)
            containerView.addSubview(imageView)
            
            imageView.contentMode = .scaleAspectFit
            imageView.bounds.origin = containerView.bounds.origin
            imageView.image = image.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = tintColor
            
            leftView = containerView
        } else {
            leftViewMode = .never
            leftView = nil
        }
    }
}
