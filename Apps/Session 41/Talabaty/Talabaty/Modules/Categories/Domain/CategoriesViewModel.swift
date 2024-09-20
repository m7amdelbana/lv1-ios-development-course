//
//  CategoriesViewModel.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 07/05/2024.
//

import Foundation
import RxSwift
import TalabatyCore

enum CategoriesState {
    case toggleLoading(isLoading: Bool)
    case didGetCategories
    case didFailedCategories(errorMessaage: String)
}

class CategoriesViewModel {
    
    private let categoriesRepo: CategoriesRepo
    /// let screenState = BehaviorSubject<CategoriesState>(value: .showLoading)
    let screenState = PublishSubject<CategoriesState>()
    var categories = [AppCategory]()
    
    init(categoriesRepo: CategoriesRepo = CategoriesRepo()) {
        self.categoriesRepo = categoriesRepo
    }
    
    func getCategories() {
        screenState.on(.next(.toggleLoading(isLoading: true)))
        categoriesRepo.getAll { [weak self] response in
            guard let self else { return }
            self.screenState.on(.next(.toggleLoading(isLoading: false)))
            switch response {
            case let .onSuccess(result):
                self.categories = result.data ?? []
                screenState.on(.next(.didGetCategories))
            case let .onFailure(error):
                screenState.on(.next(.didFailedCategories(errorMessaage: error.message)))
            }
        }
    }
}
