//
//  ChatMessage.swift
//  Instagram
//
//  Created by Mohamed Elbana on 26/02/2024.
//

import Foundation
import FirebaseDatabase

struct ChatMessage {
    
    let id: String?
    let message: String?
    let senderId: String?
    let receiverId: String?
    let date: String?
    let formattedDate: Date
    
    init(data: DataSnapshot) {
        id = data.childSnapshot(forPath: "id").value as? String
        message = data.childSnapshot(forPath: "message").value as? String
        senderId = data.childSnapshot(forPath: "senderId").value as? String
        receiverId = data.childSnapshot(forPath: "receiverId").value as? String
        date = data.childSnapshot(forPath: "date").value as? String
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss a dd/MM/yyyy"
        formattedDate = formatter.date(from: date ?? "") ?? Date()
    }
}
