//
//  CategoryCell.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 07/05/2024.
//

import UIKit
import TalabatyCore
import Kingfisher

class ProductCell: UICollectionViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!

    func configure(with product: Product) {
        if let url = product.imageUrl {
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = nil
        }
        
        titleLabel.text = product.name
        descLabel.text = product.desc
        
        if let priceAfterDiscount = product.priceAfterDiscount,
           priceAfterDiscount > 0 {
            priceLabel.text = "$\(priceAfterDiscount)"
        } else {
            priceLabel.text = "$\((product.price ?? 0))"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
