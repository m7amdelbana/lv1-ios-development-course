//
//  Story.swift
//  Instagram
//
//  Created by Mohamed Elbana on 11/12/2023.
//

import Foundation

struct Story {
    
    let imageUrl: String?
    let username: String?
    let isMyStory: Bool
    
    init(imageUrl: String?,
         username: String? = nil,
         isMyStory: Bool = false) {
        self.imageUrl = imageUrl
        self.username = username
        self.isMyStory = isMyStory
    }
}
