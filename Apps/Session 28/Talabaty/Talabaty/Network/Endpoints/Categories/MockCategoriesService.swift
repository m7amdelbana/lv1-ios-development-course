//
//  MockCategoriesService.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 11/03/2024.
//

import Foundation

class MockCategoriesService: CategoriesServiceProtocol {
    
    func getAll(pageNumber: Int, completion: @escaping (APIResponse<Page<Category>>) -> ()) {
        /// completion(.onFailure(.init(404, "Something went wrong!")))
        var page = Page<Category>()
        page.currentPage = 1
        page.pageSize = 30
        page.totalSize = 1000
        page.data = []
        completion(.onSuccess(page))
    }
}
