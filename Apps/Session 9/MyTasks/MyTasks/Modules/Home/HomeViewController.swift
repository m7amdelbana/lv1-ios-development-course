//
//  HomeViewController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 27/10/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var myTasksTableViewList = [MyTask]()
    var myTasksCollectionViewList = [MyTask]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView
        
        myTasksTableViewList.append(.init(
            title: "Pay Bill",
            date: "09:00 AM 16 OCT 2023",
            tag: .init(title: "Finance",
                       color: .init(hex: 0x606AE9))
        ))
        
        myTasksTableViewList.append(.init(
            title: "Sugar Tablet",
            date: "10:30 AM 17 OCT 2023",
            tag: .init(title: "Health",
                       color: .init(hex: 0x53DF61))
        ))
        
        // CollectionView
        
        myTasksCollectionViewList.append(.init(
            id: "Task #233",
            title: "Daily Gym Reminder Gym Reminder",
            date: "16 OCT 2023",
            time: "08:00 AM",
            tag: .init(title: "Workout",
                       color: .init(hex: 0xE55C5C))
        ))
        
        myTasksCollectionViewList.append(.init(
            id: "Task #234",
            title: "Attend office meeting",
            date: "17 OCT 2023",
            time: "09:00 AM",
            tag: .init(title: "Health",
                       color: .init(hex: 0x53DF61))
        ))
        
        setupTableView()
        setupCollectionView()
    }
}
