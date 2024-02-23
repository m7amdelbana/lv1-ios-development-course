//
//  Page.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 19/02/2024.
//

import Foundation

struct Page<T: Codable>: Codable {
    
    let currentPage: Int?
    let pageSize: Int?
    let totalSize: Int?
    let data: [T]?
}
