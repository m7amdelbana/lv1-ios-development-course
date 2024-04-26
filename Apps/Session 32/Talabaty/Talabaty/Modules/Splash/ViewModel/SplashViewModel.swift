//
//  SplashViewModel.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 22/03/2024.
//

import Foundation
import TalabatyCore

class SplashViewModel {
    
    private let repo: CategoriesRepo
    
    init(repo: CategoriesRepo = CategoriesRepo()) {
        self.repo = repo
    }
    
    func loadData() {
        repo.getAll(pageNumber: 1) { response in
            switch response {
            case let .onSuccess(data):
                print("onSuccess")
            case let .onFailure(error):
                print("onFailure: \(error)")
            }
        }
    }
}
