//
//  Story.swift
//  Instagram
//
//  Created by Mohamed Elbana on 11/12/2023.
//

import Foundation
import FirebaseDatabase

struct Story {
    
    let imageUrl: String?
    let username: String?
    let isMyStory: Bool
    var isHaveStory: Bool
    
    init(imageUrl: String?,
         username: String? = nil,
         isMyStory: Bool = false,
         isHaveStory: Bool = false) {
        self.imageUrl = imageUrl
        self.username = username
        self.isMyStory = isMyStory
        self.isHaveStory = isHaveStory
    }
    
    init(data: DataSnapshot, uid: String, isHaveStory: Bool = false) {
        imageUrl = data.childSnapshot(forPath: "imageUrl").value as? String
        username = data.childSnapshot(forPath: "username").value as? String
        let userId = data.childSnapshot(forPath: "userId").value as? String
        isMyStory = uid == userId
        self.isHaveStory = isHaveStory
    }
}
