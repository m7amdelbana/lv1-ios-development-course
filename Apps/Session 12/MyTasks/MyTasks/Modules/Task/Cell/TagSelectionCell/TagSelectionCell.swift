//
//  TagSelectionCell.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 07/11/2023.
//

import UIKit

class TagSelectionCell: UICollectionViewCell {

    @IBOutlet weak var tagView: TagView!
    
    func configure(with model: MyTaskTag) {
        tagView.setup(title: model.title,
                      color: .init(named: model.color),
                      isSelected: model.isSelected)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tagView.containerView.cornerRadius = 17.5
    }
}
