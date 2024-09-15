//
//  CategoryCell.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 07/05/2024.
//

import UIKit
import TalabatyCore
import Kingfisher

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(with category: AppCategory) {
        if let url = category.imageUrl {
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = nil
        }
        titleLabel.text = category.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 5.0
    }
}
