//
//  SignInPresenter.swift
//  Instagram
//
//  Created by Mohamed Elbana on 22/12/2023.
//

import UIKit
import FirebaseCore
import GoogleSignIn
import FirebaseAuth
import FirebaseDatabase

protocol SignInPresenterProtocol {
    func viewDidLoad()
    func didPressedGoogle(in view: UIViewController)
    func showLoading()
    func hideLoading()
}

class SignInPresenter: NSObject {
    
    private var databaseReference: DatabaseReference
    private var delegate: SignInViewControllerProtocol?
    
    init(delegate: SignInViewControllerProtocol?) {
        self.delegate = delegate
        databaseReference = Database.database().reference()
    }
    
    func setupGoogleAuth() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
    }
    
    func signInWithGoogle(in view: UIViewController) {
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
                                  imageUrl: imageUrl)
            }
        }
    }
    
    func saveUserData(id: String,
                      name: String,
                      email: String,
                      imageUrl: String) {
        databaseReference.child("Users")
            .child(id).setValue(["id": id,
                                 "name": name,
                                 "email": email,
                                 "imageUrl": imageUrl])
        delegate?.didSignedUser()
    }
    
    func logOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

// MARK: - [View] -> [Presenter]

extension SignInPresenter: SignInPresenterProtocol {

    func viewDidLoad() {
        setupGoogleAuth()
    }
    
    func didPressedGoogle(in view: UIViewController) {
        signInWithGoogle(in: view)
    }
    
    func showLoading() {
        print("showLoading")
    }
    
    func hideLoading() {
        print("hideLoading")
    }
}
