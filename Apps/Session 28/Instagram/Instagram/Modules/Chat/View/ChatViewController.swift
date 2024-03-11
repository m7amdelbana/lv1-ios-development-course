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
    private let chatId: String
    private var ref = Database.database().reference()
    private let currentUser = Auth.auth().currentUser
    
    init(receiverId: String, chatId: String) {
        self.receiverId = receiverId
        self.chatId = chatId
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        self.receiverId = ""
        self.chatId = ""
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
        ref.child("Messages")
            // .queryEqual(toValue: chatId, childKey: "chatId")
            .queryOrdered(byChild: "chatId")
            .queryEqual(toValue: chatId)
            .observe(.value, with: { (snapshot) -> Void in
                self.screenData.removeAll()
                
                for childSnapshot in snapshot.children.allObjects as! [DataSnapshot] {
                    let model = ChatMessage(data: childSnapshot)
                    self.screenData.append(model)
                }
                
                self.screenData = self.screenData.sorted(by: { $0.formattedDate.compare($1.formattedDate) == .orderedAscending })
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
    }
    
    private func sendMessage() {
        ref = Database.database().reference()
        let messsageId = UUID().uuidString
        
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss a dd/MM/yyyy"
        let stringDate = formatter.string(from: currentDate)
        
        ref.child("Messages").child(messsageId).setValue(
            [
                "id": messsageId,
                "message": messageTextField.text ?? "",
                "receiverId": receiverId,
                "senderId": currentUser?.uid ?? "",
                "chatId": chatId,
                "date": stringDate,
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

