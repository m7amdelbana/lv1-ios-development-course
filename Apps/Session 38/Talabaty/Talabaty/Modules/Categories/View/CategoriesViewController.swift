//
//  CategoriesViewController.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 07/05/2024.
//

import UIKit
import RxSwift
import TalabatyCore

class CategoriesViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    let viewModel: CategoriesViewModel
    private let disposeBag = DisposeBag()
    private var loadingManager: LoadingManager?
    
    init() {
        viewModel = CategoriesViewModel()
        super.init(nibName: String(describing: Self.self),
                   bundle: .init(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setSubscribe()
        viewModel.getCategories()
    }
    
    private func setupUI() {
        loadingManager = .init(frame: view.frame)
        navigationItem.title = "Categories"
        
        collectionView.registerCellNib(CategoryCell.self,
                                       bundle: .init(for: Self.self))
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setSubscribe() {
        viewModel.screenState.subscribe(onNext: { state in
            DispatchQueue.main.async {
                switch state {
                case let .toggleLoading(isLoading):
                    if isLoading {
                        self.loadingManager?.showLoading()
                    } else {
                        self.loadingManager?.hideLoading()
                    }
                case .didGetCategories:
                    self.collectionView.reloadData()
                case let .didFailedCategories(errorMessaage):
                    self.showAlert(message: errorMessaage)
                }
            }
        }).disposed(by: disposeBag)
    }
}

extension CategoriesViewController: UICollectionViewReference,
                                    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(CategoryCell.self, indexPath: indexPath)
        cell.configure(with: viewModel.categories[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /// let availableWidth = collectionView.bounds.width
        let availableWidth = UIScreen.main.bounds.width - 24.0
        let itemSize = availableWidth / 3.0
        return .init(width: itemSize, height: itemSize + 18)
    }
}
