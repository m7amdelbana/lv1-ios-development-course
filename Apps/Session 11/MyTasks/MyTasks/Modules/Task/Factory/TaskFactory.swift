//
//  TaskFactory.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 07/11/2023.
//

import Foundation

class TaskFactory {
    
    var tags: [MyTaskTag]
    
    init() {
        tags = [
            .init(title: "Workout",
                  color: AppColor.accent.rawValue),
            .init(title: "Finance",
                  color: AppColor.secondary.rawValue),
            .init(title: "Health",
                  color: AppColor.tertairy.rawValue),
            .init(title: "Bills",
                  color: AppColor.primary.rawValue)
        ]
    }
}
