//
//  ChatCell.swift
//  Instagram
//
//  Created by Mohamed Elbana on 26/02/2024.
//

import UIKit
import FirebaseAuth

class ChatCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var leadingView: UIView!
    @IBOutlet weak var trailingView: UIView!
    
    var currentUserId: String {
        let currentUser = Auth.auth().currentUser
        return currentUser?.uid ?? ""
    }
    
    func configure(with data: ChatMessage) {
        messageLabel.text = data.message
        dateLabel.text = data.date
        
        if data.senderId == currentUserId {
            setupOutcomeChatMessage()
        } else {
            setupIncomeChatMessage()
        }
    }
    
    private func setupOutcomeChatMessage() {
        containerView.backgroundColor = .primary
        containerStackView.alignment = .trailing
        messageLabel.textColor = .white
        leadingView.isHidden = false
        trailingView.isHidden = true
    }
    
    private func setupIncomeChatMessage() {
        containerView.backgroundColor = .backgroundColor
        containerStackView.alignment = .leading
        messageLabel.textColor = .black
        leadingView.isHidden = true
        trailingView.isHidden = false
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
