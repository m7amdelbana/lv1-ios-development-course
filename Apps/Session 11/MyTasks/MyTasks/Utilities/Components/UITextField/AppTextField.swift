//
//  AppTextField.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 31/10/2023.
//

import UIKit

@IBDesignable
class AppTextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 0, left: 26, bottom: 0, right: 26)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /// setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .white
        isRounded = true
        borderWidth = 1
        borderColor = .border
        borderStyle = .none
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
}
