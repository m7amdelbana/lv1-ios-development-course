//
//  HorizontalCell.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 07/11/2023.
//

import UIKit
import SkeletonView

protocol HorizontalCellDelegate {
    func didSelectStory(_ story: Story)
}

class HorizontalCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var list = [Story]()
    var delegate: HorizontalCellDelegate?
    
    func configure(with list: [Story],
                   delegate: HorizontalCellDelegate?) {
        self.list = list
        self.delegate = delegate
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
}
