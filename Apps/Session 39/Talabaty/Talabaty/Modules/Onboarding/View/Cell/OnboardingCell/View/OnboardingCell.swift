//
//  OnboardingCell.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 15/05/2024.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    func configure(with model: OnboardingModel) {
        imageView.image = UIImage(named: model.image)
        titleLabel.text = model.title
        descLabel.text = model.desc
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
