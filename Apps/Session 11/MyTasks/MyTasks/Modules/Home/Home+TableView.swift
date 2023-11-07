//
//  Home+TableView.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 27/10/2023.
//

import UIKit

extension HomeViewController: UITableViewReference {
    
    func setupTableView() {
        tableView.registerCellNib(HorizontalCell.self)
        tableView.registerCellNib(TaskTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTasksTableViewList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeue(HorizontalCell.self)
            
            // Closure
            /*
             cell.configure(with: myTasksCollectionViewList) { item in
             // Add extra function
             self.presentTask(item)
             }
             /// cell.configure(with: myTasksCollectionViewList, didSelectItem: presentTask(_:))
             */
            
            // Delegate
            cell.configure(with: myTasksCollectionViewList,
                           delegate: self)
            
            return cell
        default:
            let cell = tableView.dequeue(TaskTableViewCell.self)
            cell.configure(with: myTasksTableViewList[indexPath.row - 1])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            let model = myTasksTableViewList[indexPath.row - 1]
            presentTask(model)
        }
    }
}

extension HomeViewController: HorizontalCellDelegate {
    
    func didSelectTask(_ myTask: MyTask) {
        presentTask(myTask)
    }
    
    func didLogOutClicked() {
        // Delete user data
        
        let vc = IntroductionViewController()
        RootRouter.presentRootScreen(with: vc)
    }
}
