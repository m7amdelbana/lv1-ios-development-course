//
//  TaskTableViewCell.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 27/10/2023.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var tagView: TagView!
    
    func configure(with model: MyTask) {
        titleLabel.text = model.title
        dateLabel.text = model.date
        tagView.setup(title: model.tag.title,
                      color: .init(named: model.tag.color))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.setCornerRadius(16)
        containerView.setShadow(
            color: .init(hex: 0x323B47),
            opacity: 0.08,
            offset: .init(width: 1, height: 3))
    }
}
