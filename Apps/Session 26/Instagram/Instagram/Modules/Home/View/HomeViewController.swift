//
//  HomeViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 04/12/2023.
//

import UIKit
import SkeletonView
import FirebaseAuth
import FirebaseDatabase
import FirebaseMessaging

class HomeViewController: UIViewController,
                          UINavigationControllerDelegate {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var dataSource: PostsDataSource?
    private let imagePicker = UIImagePickerController()
    private let authRepo = AuthRepo()
    private var needToAddPost: Bool = true
    private var ref: DatabaseReference?
    
    var stories = [Story]()
    var posts = [Post]()
    var myImageUrl: String?
    
    private let dispatchGroup = DispatchGroup()
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
        imagePicker.delegate = self
        loadData()
        
        Messaging.messaging().token { token, error in
            if let error = error {
                print("Error fetching FCM registration token: \(error)")
            } else if let token = token {
                print("FCM registration token: \(token)")
            }
        }
        
        fetchStories()
        fetchPosts()
        
        dispatchGroup.notify(queue: .main) {
            print("DID FETCH STORIES...")
            print("DID FETCH POSTS...")
        }
    }
    
    private func fetchStories() {
        dispatchGroup.enter()
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.dispatchGroup.leave()
        }
    }
    
    private func fetchPosts() {
        dispatchGroup.enter()
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            self.dispatchGroup.leave()
        }
    }
    
    private func loadData() {
        DispatchQueue.main.async {
            // UI Thread
        }
        
        DispatchQueue.global(qos: .background).async {
            // Background
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            // Background
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            // Background
        }
        
        DispatchQueue.global(qos: .default).async {
            // Background
        }
        
        
        DispatchQueue.global(qos: .background).async {
            self.authRepo.getUser { userDic in
                self.myImageUrl = userDic?["imageUrl"] as? String
                self.loadStories()
            }
        }
    }
    
    private func loadStories() {
        ref = Database.database().reference()
        guard let ref else { return }
        
        let currentUser = Auth.auth().currentUser
        guard let uid = currentUser?.uid else { return }
        
        ref.child("Stories").observe(.value, with: { (snapshot) -> Void in
            self.stories.removeAll()
            
            var myStory: Story?
            
            for childSnapshot in snapshot.children.allObjects as! [DataSnapshot] {
                let model = Story(data: childSnapshot, uid: uid)
                
                if model.isMyStory {
                    myStory = model
                    myStory?.isHaveStory = true
                } else {
                    self.stories.append(model)
                }
            }
            
            if let myStory {
                self.stories.insert(myStory, at: 0)
            } else {
                self.stories.insert(
                    .init(imageUrl: self.myImageUrl,
                          isMyStory: true,
                          isHaveStory: false),
                    at: 0)
            }
            self.reloadTableView()
        })
    }
    
    private func setupNavigation() {
        let addImage = UIImage(named: "add")
        let addButton = UIBarButtonItem(
            image: addImage,
            style: .plain,
            target: self,
            action: #selector(didPressedAddButton))
        
        let chatImage = UIImage(named: "chat")
        let chatButton = UIBarButtonItem(
            image: chatImage,
            style: .plain,
            target: self,
            action: #selector(didPressedChatButton))
        
        navigationItem.rightBarButtonItems = [chatButton, addButton]
    }
    
    @objc func didPressedAddButton() {
        showOptionsAlert(needToAddPost: true)
    }
    
    @objc func didPressedChatButton() {
        let vc = MessagesViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showOptionsAlert(needToAddPost: Bool) {
        self.needToAddPost = needToAddPost
        let alert = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .actionSheet)
        let openPhotosAction = UIAlertAction(title: "Open Photos",
                                             style: .default) { _ in
            self.pickImage(with: .photoLibrary)
        }
        let openCameraAction = UIAlertAction(title: "Open Camera",
                                             style: .default) { _ in
            self.pickImage(with: .camera)
        }
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel)
        alert.addAction(openPhotosAction)
        alert.addAction(openCameraAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private func pickImage(with source: UIImagePickerController.SourceType) {
        imagePicker.sourceType = source
        present(imagePicker, animated: true)
    }
    
    private func setupTableView() {
        dataSource = .init(delegate: self,
                           collectionDelegate: self)
        dataSource?.setup(tableView)
    }
    
    private func reloadTableView() {
        self.dataSource?.configure(with: self.posts,
                                   collectionList: self.stories)
        
        self.tableView.delegate = self.dataSource
        self.tableView.dataSource = self.dataSource
        
        self.tableView.reloadData()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: false)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
           let imageUrl = info[UIImagePickerController.InfoKey.imageURL] as? NSURL {
            self.presentImageReviwer(
                image: image,
                imageUrl: imageUrl.absoluteString ?? "")
        }
    }
    
    private func presentImageReviwer(image: UIImage, imageUrl: String) {
        let vc = ImageReviewerViewController(
            image: image,
            imageUrl: imageUrl,
            type: needToAddPost ? .post : .story) { confirmedImage in
                print("CONFIRM: \(self.needToAddPost)")
            }
        vc.modalPresentationStyle = .fullScreen
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIApplication.topViewController()?.present(vc, animated: true)
        }
    }
}

extension HomeViewController: HorizontalCellDelegate {
    
    func didSelectStory(_ story: Story) {
        if story.isMyStory && !story.isHaveStory {
            showOptionsAlert(needToAddPost: false)
        } else {
            viewStory(imageUrl: story.imageUrl ?? "")
        }
    }
    
    private func viewStory(imageUrl: String) {
        let vc = ViewStoryViewController(imageUrl: imageUrl)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}

extension HomeViewController: PostsDataSourceDelegate {
    
    func didSelectItem(_ post: Post) {
        
    }
    
    func didClickedLike(on post: Post) {
        
    }
    
    func didClickedComment(on post: Post) {
        
    }
    
    func didClickedViewComments(on post: Post) {
        
    }
    
    func didClickedShare(on post: Post) {
        
    }
}
