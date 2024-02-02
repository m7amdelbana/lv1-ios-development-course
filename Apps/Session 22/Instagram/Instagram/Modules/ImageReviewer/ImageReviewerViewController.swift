//
//  ImageReviewerViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 19/01/2024.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

enum ImageReviewerType {
    case story
    case post
    case profile
}

class ImageReviewerViewController: UIViewController {
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    private let image: UIImage
    private let imageUrl: String
    private let type: ImageReviewerType
    private let didConfirm: (UIImage) -> ()
    private let authRepo = AuthRepo()
    private let dbRef = Database.database().reference()
    
    init(image: UIImage,
         imageUrl: String,
         type: ImageReviewerType,
         didConfirm: @escaping (UIImage) -> ()) {
        self.image = image
        self.imageUrl = imageUrl
        self.type = type
        self.didConfirm = didConfirm
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        switch type {
        case .story:
            confirmButton.setTitle("Add story", for: .normal)
        case .post:
            confirmButton.setTitle("Add post", for: .normal)
        case .profile:
            confirmButton.setTitle("Change profile photo", for: .normal)
        }
    }
    
    private func addStory() {
        uploadImage(folder: "Stories", imageUrl: imageUrl)
    }
    
    private func addPost() {
        uploadImage(folder: "Posts", imageUrl: imageUrl)
    }
    
    private func changeProfilePhoto() {
        uploadImage(folder: "Profiles", imageUrl: imageUrl)
    }
    
    private func uploadImage(folder: String, imageUrl: String) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let imageName: String = String(imageUrl.split(separator: "/").last ?? "")
        
        let localFile = URL(string: imageUrl)!
        let storyRef = storageRef.child("\(folder)/\(imageName)")
        
        let uploadTask = storyRef.putFile(
            from: localFile,
            metadata: nil) { metadata, error in
                storyRef.downloadURL { (url, error) in
                    if let downloadURL = url {
                        self.setStoryToDB(downloadURL)
                    }
                }
            }
    }
    
    func setStoryToDB(_ url: URL) {
        authRepo.getUser { userDic in
            guard let id = userDic?["id"] as? String,
                  let username = userDic?["username"] as? String else {
                return
            }
            
            self.dbRef.child("Stories")
                .child(UUID().uuidString).setValue(
                    ["userId": id,
                     "username": username,
                     "imageUrl": url.absoluteString])
            
            self.didConfirm(self.image)
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func actionConfirm(_ sender: Any) {
        switch type {
        case .story: addStory()
        case .post: addPost()
        case .profile: changeProfilePhoto()
        }
    }
    
    @IBAction func actionClose(_ sender: Any) {
        dismiss(animated: true)
    }
}
