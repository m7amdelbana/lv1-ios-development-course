//
//  AuthRepo.swift
//  Instagram
//
//  Created by Mohamed Elbana on 19/01/2024.
//

import Foundation
import FirebaseCore
import GoogleSignIn
import FirebaseAuth
import FirebaseDatabase

class AuthRepo {
    
    private var databaseReference: DatabaseReference
    
    init() {
        databaseReference = Database.database().reference()
        setupGoogleAuth()
    }
    
    private func setupGoogleAuth() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
    }
    
    func signInWithGoogle(in view: UIViewController,
                          completed: @escaping () -> ()) {
        GIDSignIn.sharedInstance.signIn(withPresenting: view) { [unowned self] result, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
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
                                  imageUrl: imageUrl,
                                  completed: completed)
            }
        }
    }
    
    private func saveUserData(id: String,
                              name: String,
                              email: String,
                              imageUrl: String,
                              completed: @escaping () -> ()) {
        databaseReference.child("Users").child(id).observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            if value == nil {
                self.databaseReference.child("Users")
                    .child(id).setValue(
                        ["id": id,
                         "name": name,
                         "username": self.generateUsername(name),
                         "email": email,
                         "imageUrl": imageUrl])
            }
            completed()
        }) { error in
            print(error.localizedDescription)
        }
    }
    
    func logOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    private func generateUsername(_ name: String) -> String {
        let random = Int.random(in: 1000...9999)
        let username = name.replacingOccurrences(of: " ", with: "")
        return "\(username.lowercased())\(random)"
    }
}
