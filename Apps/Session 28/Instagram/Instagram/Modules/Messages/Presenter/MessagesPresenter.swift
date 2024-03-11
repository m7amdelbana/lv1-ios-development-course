//
//  MessagesPresenter.swift
//  Instagram
//
//  Created by Mohamed Elbana on 26/02/2024.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

protocol MessagesPresenterProtocol {
    func viewDidLoad()
}

class MessagesPresenter {
    
    private var users = [User]()
    private var ref: DatabaseReference?
    private let delegate: MessagesViewControllerProtocol?
    
    init(delegate: MessagesViewControllerProtocol?) {
        self.delegate = delegate
    }
    
    private func loadData() {
        delegate?.showLoading()
        
        ref = Database.database().reference()
        guard let ref else { return }
        
        let currentUser = Auth.auth().currentUser
        guard let uid = currentUser?.uid else { return }
        
        ref.child("Users").observe(.value, with: { (snapshot) -> Void in
            self.users.removeAll()
            
            for childSnapshot in snapshot.children.allObjects as! [DataSnapshot] {
                let model = User(data: childSnapshot)
                if model.id != uid {
                    self.users.append(model)
                }
            }
            
            DispatchQueue.main.async {
                self.delegate?.hideLoading()
                self.delegate?.didDataLoaded(self.users)
            }
        })
    }
}

// MARK: - [View] -> [Presenter]

extension MessagesPresenter: MessagesPresenterProtocol {
    
    func viewDidLoad() {
        loadData()
    }
}
