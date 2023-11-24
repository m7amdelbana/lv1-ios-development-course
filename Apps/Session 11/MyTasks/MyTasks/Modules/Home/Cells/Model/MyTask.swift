//
//  MyTask.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 27/10/2023.
//

import UIKit

// MARK: CoreData class

class MyTask {
    
    let id: String
    let title: String
    let descriptionTitle: String
    let date: String
    let tag: MyTaskTag
    
    init(id: String = "",
         title: String,
         descriptionTitle: String = "",
         date: String,
         tag: MyTaskTag) {
        self.id = id
        self.title = title
        self.descriptionTitle = descriptionTitle
        self.date = date
        self.tag = tag
    }
}

class MyTaskTag {
    
    let title: String
    let color: String
    var isSelected: Bool
    
    init(title: String, color: String, isSelected: Bool = false) {
        self.title = title
        self.color = color
        self.isSelected = isSelected
    }
}

