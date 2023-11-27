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
        setupTableView()
        refreshData()
        
        /*
        let data = CoreDataManager().fetchMyTasks() ?? []
        
        // TableView
        myTasksTableViewList = data
            .filter { !$0.isToday }
            .sorted(by: { $0.formattedDate.compare($1.formattedDate) == .orderedAscending } )
        
        /*
        myTasksTableViewList = data.filter({ item in
            return item.isToday
        })
         
         myTasksTableViewList = data.filter { $0.isToday }
        */
        
        // CollectionView
        myTasksCollectionViewList = data
            .filter { $0.isToday }
            .sorted(by: { $1.formattedDate.compare($0.formattedDate) == .orderedDescending })
        
        setupTableView()
        */
    }
    
    @IBAction func actionAdd(_ sender: Any) {
        presentTask()
    }
    
    func presentTask(_ myTask: MyTask? = nil) {
        let vc = TaskViewController(myTask: myTask, delegate: self)
        present(vc, animated: true)
    }
}

extension HomeViewController: TaskViewDelegate {
   
    func refreshData() {
        let data = CoreDataManager().fetchMyTasks() ?? []
        
        myTasksTableViewList = data
            .filter { !$0.isToday }
            .sorted(by: { $0.formattedDate.compare($1.formattedDate) == .orderedAscending } )
        
        myTasksCollectionViewList = data
            .filter { $0.isToday }
            .sorted(by: { $1.formattedDate.compare($0.formattedDate) == .orderedDescending })
        
        tableView.reloadData()
    }
}
