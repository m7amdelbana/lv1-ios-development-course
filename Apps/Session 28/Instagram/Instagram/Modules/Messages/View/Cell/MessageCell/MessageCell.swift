//
//  MessageCell.swift
//  Instagram
//
//  Created by Mohamed Elbana on 26/02/2024.
//

import UIKit
import Kingfisher

class MessageCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    func configure(with data: User) {
        if let url = URL(string: data.imageUrl ?? "") {
            profileImageView.kf.setImage(with: url)
        }
        nameLabel.text = data.name
        usernameLabel.text = data.username
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
