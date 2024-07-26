//
//  Page.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 19/02/2024.
//

import Foundation

public struct Page<T: Codable>: Codable {
    
    public var currentPage: Int?
    public var pageSize: Int?
    public var totalSize: Int?
    public var data: [T]?
    
    public init(currentPage: Int? = nil, pageSize: Int? = nil, totalSize: Int? = nil, data: [T]? = nil) {
        self.currentPage = currentPage
        self.pageSize = pageSize
        self.totalSize = totalSize
        self.data = data
    }
}
