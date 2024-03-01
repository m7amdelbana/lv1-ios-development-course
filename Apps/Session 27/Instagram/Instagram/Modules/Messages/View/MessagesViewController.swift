//
//  MessagesViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 26/02/2024.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

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
        getChatId(receiverId: screenData[indexPath.row].id ?? "")
    }
    
    private func getChatId(receiverId: String) {
        let ref = Database.database().reference()
        let currentUser = Auth.auth().currentUser
        
        ref.child("Users")
            .child(currentUser?.uid ?? "")
            .child("chatIds")
            .child(receiverId)
            .observeSingleEvent(of: .value) { [self] (snapshot, _) -> Void in
                var chatId = ""
                if (snapshot.value as? NSDictionary)?["chatId"] == nil {
                    chatId = UUID().uuidString
                    pushChatId(to: currentUser?.uid ?? "", otherId: receiverId, chatId: chatId)
                    pushChatId(to: receiverId, otherId: currentUser?.uid ?? "", chatId: chatId)
                } else {
                    chatId = (snapshot.value as? NSDictionary)?["chatId"] as? String ?? ""
                }
                
                DispatchQueue.main.async {
                    let vc = ChatViewController(receiverId: receiverId,
                                                chatId: chatId)
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
    }
    
    func pushChatId(to userId: String, otherId: String, chatId: String) {
        let ref = Database.database().reference()
        ref.child("Users")
            .child(userId)
            .child("chatIds")
            .child(otherId)
            .setValue([ "chatId": chatId ])
    }
}
