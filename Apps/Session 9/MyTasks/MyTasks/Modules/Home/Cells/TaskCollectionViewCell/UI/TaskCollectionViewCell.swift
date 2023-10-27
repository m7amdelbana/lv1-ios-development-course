//
//  TaskCollectionViewCell.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 27/10/2023.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var tagView: UIView!
    @IBOutlet private weak var tagLabel: UILabel!
    
    func configure(with model: MyTask) {
        idLabel.text = model.id
        titleLabel.text = model.title
        dateLabel.text = model.date
        timeLabel.text = model.time
        tagView.backgroundColor = model.tag.color.withAlphaComponent(0.2)
        tagLabel.text = model.tag.title
        tagLabel.textColor = model.tag.color
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.cornerRadius(16)
        containerView.setShadow(
            color: .init(hex: 0x323B47),
            opacity: 0.08,
            offset: .init(width: 1, height: 3))
        
        tagView.cornerRadius(12)
    }
}
