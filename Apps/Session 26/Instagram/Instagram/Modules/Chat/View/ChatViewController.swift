//
//  ChatViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 26/02/2024.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    private var screenData = [ChatMessage]()
    private let receiverId: String
    private var ref: DatabaseReference?
    
    init(receiverId: String) {
        self.receiverId = receiverId
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        self.receiverId = ""
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadData()
    }
    
    @IBAction func actionSend(_ sender: Any) {
        if let message = messageTextField.text,
           !message.isEmpty {
            sendMessage()
        }
    }
    
    private func loadData() {
        ref = Database.database().reference()
        guard let ref else { return }
        
        ref.child("Messages").observe(.value, with: { (snapshot) -> Void in
            self.screenData.removeAll()
            
            for childSnapshot in snapshot.children.allObjects as! [DataSnapshot] {
                let model = ChatMessage(data: childSnapshot)
                self.screenData.append(model)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    private func sendMessage() {
        ref = Database.database().reference()
        guard let ref else { return }
        
        let currentUser = Auth.auth().currentUser
        guard let uid = currentUser?.uid else { return }
        
        let messsageId = UUID().uuidString
        
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a dd/MM/yyyy"
        let stringDate = formatter.string(from: currentDate)
        
        ref.child("Messages").child(messsageId).setValue(
            [
                "id": messsageId,
                "message": messageTextField.text ?? "",
                "receiverId": receiverId,
                "senderId": uid,
                "users": "\(uid),\(receiverId)",
                "date": stringDate
            ])
        
        messageTextField.text = ""
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableView() {
        tableView.registerCellNib(ChatCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        screenData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(ChatCell.self)
        cell.configure(with: screenData[indexPath.row])
        return cell
    }
}

