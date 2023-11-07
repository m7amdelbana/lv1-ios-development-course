//
//  HomeViewController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 27/10/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var myTasksTableViewList = [MyTask]()
    var myTasksCollectionViewList = [MyTask]()
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "MyTasks"
        
        // TableView
        
        myTasksTableViewList.append(.init(
            title: "Pay Bill",
            descriptionTitle: "Pay Bill for today",
            date: "09:00 AM 16 OCT 2023",
            tag: .init(title: "Finance",
                       color: AppColor.secondary.rawValue)
        ))
        
        myTasksTableViewList.append(.init(
            title: "Sugar Tablet",
            date: "10:30 AM 17 OCT 2023",
            tag: .init(title: "Health",
                       color: "Primary")
        ))
        
        // CollectionView
        
        myTasksCollectionViewList.append(.init(
            id: "Task #233",
            title: "Daily Gym Reminder Gym Reminder",
            date: "16 OCT 2023",
            time: "08:00 AM",
            tag: .init(title: "Workout",
                       color: "Primary")
        ))
        
        myTasksCollectionViewList.append(.init(
            id: "Task #234",
            title: "Attend office meeting",
            date: "17 OCT 2023",
            time: "09:00 AM",
            tag: .init(title: "Health",
                       color: "Primary")
        ))
        
        setupTableView()
    }
    
    @IBAction func actionAdd(_ sender: Any) {
        presentTask()
    }
    
    func presentTask(_ myTask: MyTask? = nil) {
        let vc = TaskViewController(myTask: myTask)
        present(vc, animated: true)
    }
}
