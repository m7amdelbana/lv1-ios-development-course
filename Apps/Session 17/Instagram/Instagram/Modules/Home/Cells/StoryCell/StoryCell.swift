//
//  StoryCell.swift
//  Instagram
//
//  Created by Mohamed Elbana on 11/12/2023.
//

import UIKit
import IBAnimatable

class StoryCell: UICollectionViewCell {

    @IBOutlet weak var profileImageView: AnimatableImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var plusView: UIView!
    
    func configure(with entity: Story) {
        // Load imageURL
        
        if entity.isMyStory {
            profileNameLabel.text = "Your story"
            plusView.isHidden = false
        } else {
            profileNameLabel.text = entity.username
            plusView.isHidden = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
