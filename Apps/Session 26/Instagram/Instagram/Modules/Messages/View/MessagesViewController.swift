//
//  MessagesViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 26/02/2024.
//

import UIKit

protocol MessagesViewControllerProtocol {
    func showLoading()
    func hideLoading()
    func didDataLoaded(_ data: [User])
}

class MessagesViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    private var presenter: MessagesPresenterProtocol? = nil
    private var screenData = [User]()
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
        presenter = MessagesPresenter(delegate: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Messages"
        setupTableView()
        presenter?.viewDidLoad()
    }
}

// MARK: - [Presenter] -> [View]

extension MessagesViewController: MessagesViewControllerProtocol {
    
    func showLoading() {
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
    }
    
    func hideLoading() {
        loadingIndicator.isHidden = true
        loadingIndicator.stopAnimating()
    }

    func didDataLoaded(_ data: [User]) {
        screenData = data
        tableView.reloadData()
    }
}

extension MessagesViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableView() {
        tableView.registerCellNib(MessageCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        screenData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(MessageCell.self)
        cell.configure(with: screenData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatViewController(receiverId: screenData[indexPath.row].id ?? "")
        navigationController?.pushViewController(vc, animated: true)
    }
}
