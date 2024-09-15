//
//  ProductsViewController.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 15/09/2024.
//

import UIKit
import RxSwift
import TalabatyCore

class ProductsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel: ProductsViewModel
    private let disposeBag = DisposeBag()
    private let screenTitle: String
    private let refreshControl = UIRefreshControl()
    
    init(category: AppCategory) {
        viewModel = ProductsViewModel(categoryId: category.id ?? "")
        screenTitle = category.name ?? ""
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
        viewModel.getProducts()
    }
    
    private func setupUI() {
        navigationItem.title = screenTitle
        
        collectionView.registerCellNib(ProductCell.self, bundle: .init(for: Self.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.addSubview(refreshControl)
        refreshControl.addTarget(self,
                                 action: #selector(reload),
                                 for: .valueChanged)
    }
    
    @objc private func reload() {
        refreshControl.endRefreshing()
        viewModel.reloadData()
    }
    
    private func setSubscribe() {
        viewModel.screenState.subscribe(onNext: { state in
            DispatchQueue.main.async {
                switch state {
                case .dataLoaded:
                    self.collectionView.reloadData()
                case .showError(_):
                    break
                case .updateUI:
                    self.collectionView.reloadData()
                }
            }
        }).disposed(by: disposeBag)
    }
}

extension ProductsViewController: UICollectionViewReference,
                                  UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(ProductCell.self, indexPath: indexPath)
        cell.configure(with: viewModel.products[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = UIScreen.main.bounds.width - 16.0
        let itemSize = availableWidth / 2.0
        return .init(width: itemSize, height: 234)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == viewModel.products.count - 2 {
            viewModel.loadMoreData()
        }
    }
}

