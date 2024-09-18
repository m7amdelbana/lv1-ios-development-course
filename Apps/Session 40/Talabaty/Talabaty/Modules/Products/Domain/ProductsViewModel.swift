//
//  ProductsViewModel.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 15/09/2024.
//

import Foundation
import TalabatyCore
import RxSwift

enum ProductsState {
    case dataLoaded
    case updateUI
    case showError(_ message: String)
}

enum ProductsLoadingState {
    case showLoading
    case hideLoading
}

class ProductsViewModel {
    
    private let categoryId: String
    private let productsRepo: ProductsRepo
    
    let screenState = PublishSubject<ProductsState>()
    let screenLoadingState = BehaviorSubject<ProductsLoadingState>(value: .showLoading)
    
    private var pageNumber: Int = 1
    private let pageSize: Int = 10
    private var canFetchMoreData = true
    
    var products = [Product]()
    
    init(categoryId: String, productsRepo: ProductsRepo = ProductsRepo()) {
        self.categoryId = categoryId
        self.productsRepo = productsRepo
    }
    
    func getProducts() {
        productsRepo.get(categoryId: categoryId, 
                         pageNumber: pageNumber,
                         pageSize: pageSize) { [weak self] response in
            guard let self else { return }
            self.screenLoadingState.on(.next(.hideLoading))
            switch response {
            case let .onSuccess(result):
                let newData = result.data ?? []
                if pageNumber == 1 {
                    self.products = newData
                } else {
                    self.products.append(contentsOf: newData)
                }
                
                let currentPage = result.currentPage ?? 0
                let pageSize = result.pageSize ?? 0
                let totalSize = result.totalSize ?? 0
                
                canFetchMoreData = totalSize > (currentPage * pageSize)
                
                screenState.on(.next(.dataLoaded))
            case let .onFailure(error):
                screenState.on(.next(.showError(error.message)))
            }
        }
    }
    
    func reloadData() {
        screenLoadingState.on(.next(.showLoading))
        pageNumber = 1
        /// products.removeAll()
        getProducts()
    }
    
    func loadMoreData() {
        if canFetchMoreData {
            pageNumber += 1
            getProducts()
        }
    }
    
    func updateProductQuantity(productId: String, quantity: Int) {
        // API
    }
}

