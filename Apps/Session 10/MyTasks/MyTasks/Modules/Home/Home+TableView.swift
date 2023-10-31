//
//  Home+TableView.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 27/10/2023.
//

import UIKit

extension HomeViewController: UITableViewReference {
    
    func setupTableView() {
        // Old
        // let cellId = String(describing: TaskTableViewCell.self)
        // let nib = UINib(nibName: cellId, bundle: nil)
        // tableView.register(nib, forCellReuseIdentifier: cellId)
        
        // New
        tableView.registerCellNib(TaskTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /// Optional
    ///
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTasksTableViewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Old
        // let cellId = String(describing: TaskTableViewCell.self)
        // let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? TaskTableViewCell
        // cell?.configure(with: myTasksList[indexPath.row])
        // return cell ?? UITableViewCell()
        
        // New
        let cell = tableView.dequeue(TaskTableViewCell.self)
        cell.configure(with: myTasksTableViewList[indexPath.row])
        return cell
    }
    
    /// Optional
    ///
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    /// Optional
    ///
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt: \(indexPath.row)")
        
        let model = myTasksTableViewList[indexPath.row]
        print("Model: \(model)")
    }
}
