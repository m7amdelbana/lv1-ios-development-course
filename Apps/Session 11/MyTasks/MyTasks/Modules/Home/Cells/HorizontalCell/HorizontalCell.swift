//
//  HorizontalCell.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 07/11/2023.
//

import UIKit

//@objc protocol HorizontalCellDelegate {
//    // @objc optional func didSelectTask(_ myTask: MyTask)
//    @objc optional func didLogOutClicked()
//}

protocol HorizontalCellDelegate {
    func didSelectTask(_ myTask: MyTask)
    func didLogOutClicked()
}

class HorizontalCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var list = [MyTask]()
    private var delegate: HorizontalCellDelegate?
    private var didSelectItem: ((MyTask) -> Void)?
    
    func configure(with list: [MyTask],
                   delegate: HorizontalCellDelegate?) {
        self.list = list
        self.delegate = delegate
        collectionView.reloadData()
    }
    
    
    func configure(with list: [MyTask],
                   didSelectItem: ((MyTask) -> Void)?) {
        self.list = list
        self.didSelectItem = didSelectItem
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    @IBAction func actionLogout(_ sender: Any) {
        delegate?.didLogOutClicked()
    }
}

extension HorizontalCell: UICollectionViewReference,
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
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(TaskCollectionViewCell.self,
                                          indexPath: indexPath)
        cell.configure(with: list[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellWdith = screenWidth * 0.8
        return .init(width: cellWdith, height: 135)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = list[indexPath.row]
        // Closure
        // didSelectItem?(model)
        
        // Delegate
        delegate?.didSelectTask(model)
    }
}

