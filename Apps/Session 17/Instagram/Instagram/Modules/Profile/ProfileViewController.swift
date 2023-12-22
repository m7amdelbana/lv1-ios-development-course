//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 04/12/2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var ref: DatabaseReference!
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        ref = Database.database().reference()
        readUserData()
    }
    
    private func readUserData() {
        let currentUser = Auth.auth().currentUser
        guard let uid = currentUser?.uid else { return }
        
        ref.child("Users").child(uid).observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String ?? ""
            
            DispatchQueue.main.async {
                self.nameLabel.text = name
            }
        }) { error in
            print(error.localizedDescription)
        }
    }
}
