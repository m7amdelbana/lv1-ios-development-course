//
//  Home+CollectionView.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 27/10/2023.
//

import UIKit

extension HomeViewController: UICollectionViewReference,
                              UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        collectionView.registerCellNib(TaskCollectionViewCell.self)
        let padding = 16.5
        collectionView.contentInset = .init(top: 0,
                                            left: padding,
                                            bottom: 0,
                                            right: padding)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myTasksCollectionViewList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(TaskCollectionViewCell.self,
                                          indexPath: indexPath)
        cell.configure(with: myTasksCollectionViewList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellWdith = screenWidth * 0.8
        return .init(width: cellWdith, height: 135)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
