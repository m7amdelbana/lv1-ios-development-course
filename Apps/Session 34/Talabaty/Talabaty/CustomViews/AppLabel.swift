//
//  AppLabel.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 10/05/2024.
//

import UIKit

class AppLabel: UILabel {
    
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
        let fontName = UIFont().setCustomFont(font.fontName)
        font = .init(name: fontName, size: font.pointSize)
    }
}

