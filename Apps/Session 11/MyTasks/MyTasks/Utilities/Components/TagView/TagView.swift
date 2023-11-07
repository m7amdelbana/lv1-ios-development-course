//
//  TagView.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 31/10/2023.
//

import UIKit

class TagView: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
    func setup(title: String,
               color: UIColor?,
               isSelected: Bool = false) {
        containerView.backgroundColor = color?.withAlphaComponent(0.2)
        titleLabel.textColor = color
        titleLabel.text = title
        
        if isSelected {
            containerView.borderColor = color
            containerView.borderWidth = 2.0
        } else {
            containerView.borderColor = .clear
            containerView.borderWidth = 0
        }
    }
}
