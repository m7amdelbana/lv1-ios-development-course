//
//  SignInViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 15/12/2023.
//

import UIKit
import FirebaseCore
import GoogleSignIn
import FirebaseAuth
import FirebaseDatabase

class SignInViewController: UIViewController {
    
    private var databaseReference: DatabaseReference?
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGoogleAuth()
    }
    
    private func setupGoogleAuth() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
    }
    
    @IBAction func didPressedFacebook(_ sender: Any) {
        
    }
    
    @IBAction func didPressedGoogle(_ sender: Any) {
        signInWithGoogle()
    }
    
    private func signInWithGoogle() {
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else { 
                print(error)
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                print("User or idToken null..")
                return
            }
            
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { result, error in
                print("Success!")
                
                let id = result?.user.uid ?? ""
                let profile = result?.additionalUserInfo?.profile
                let name = (profile?["name"] as? String) ?? ""
                let email = (profile?["email"] as? String) ?? ""
                let imageUrl = (profile?["picture"] as? String) ?? ""
                
                self.saveUserData(id: id,
                                  name: name,
                                  email: email,
                                  imageUrl: imageUrl)
                
                // result?.user.uid
                // UbhxzbN3vHVm3wjgJfrp5141v2t1
                // result?.additionalUserInfo?.profile
                // name: Mohamed Elbana
                // email: m7amdelbana@gmail.com
                // image:
                // MARK: - TODO
                // Save user info in DB
            }
        }
    }
    
    private func saveUserData(id: String, 
                              name: String,
                              email: String,
                              imageUrl: String) {
        databaseReference = Database.database().reference()
        guard let databaseReference else { return }
        databaseReference.child("Users")
            .child(id).setValue(["id": id,
                                 "name": name,
                                 "email": email,
                                 "imageUrl": imageUrl])
    }
    
    private func logOut() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
