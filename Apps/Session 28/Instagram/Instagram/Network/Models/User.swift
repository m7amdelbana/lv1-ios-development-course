//
//  User.swift
//  Instagram
//
//  Created by Mohamed Elbana on 26/02/2024.
//

import Foundation
import FirebaseDatabase

struct User {
    
    let id: String?
    let name: String?
    let username: String?
    let imageUrl: String?
    
    init(data: DataSnapshot) {
        id = data.childSnapshot(forPath: "id").value as? String
        name = data.childSnapshot(forPath: "name").value as? String
        username = data.childSnapshot(forPath: "username").value as? String
        imageUrl = data.childSnapshot(forPath: "imageUrl").value as? String
    }
}
