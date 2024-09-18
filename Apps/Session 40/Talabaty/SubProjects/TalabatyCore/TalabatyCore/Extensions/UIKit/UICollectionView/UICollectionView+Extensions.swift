//
//  UICollectionView+Extensions.swift
//  TalabatyCore
//
//  Created by Mohamed Elbana on 07/05/2024.
//

import UIKit

public typealias UICollectionViewReference = UICollectionViewDelegate & UICollectionViewDataSource

public extension UICollectionView {
    
    func registerCellNib<Cell: UICollectionViewCell>(_ cellClass: Cell.Type, 
                                                     bundle: Bundle) {
        let id = String(describing: cellClass.self)
        register(UINib(nibName: id, bundle: bundle),
                 forCellWithReuseIdentifier: id)
    }
    
    func registerCellNib<Cell: UICollectionViewCell>(_ cellClass: Cell.Type,
                                                     id: String,
                                                     nib: UINib) {
        register(nib, forCellWithReuseIdentifier: id)
    }
    
    func dequeue<Cell: UICollectionViewCell>(_ cellClass: Cell.Type, 
                                             indexPath: IndexPath) -> Cell {
        let id = String(describing: cellClass.self)
        guard let cell = dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? Cell else {
            fatalError("Error in cell: \(id)")
        }
        return cell
    }
    
    func dequeue<Cell: UICollectionViewCell>(_ cellClass: Cell.Type,
                                             id: String,
                                             indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? Cell else {
            fatalError("Error in cell: \(id)")
        }
        return cell
    }
}
