//
//  HomeViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 04/12/2023.
//

import UIKit
import SkeletonView

class HomeViewController: UIViewController,
                          UINavigationControllerDelegate {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var dataSource: PostsDataSource?
    private let imagePicker = UIImagePickerController()
    private let authRepo = AuthRepo()
    private var needToAddPost: Bool = true
    
    var stories = [Story]()
    var posts = [Post]()
    
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
    }
    
    private func loadData() {
        authRepo.getUser { userDic in
            if let imageUrl = userDic?["imageUrl"] as? String {
                self.stories.append(.init(imageUrl: imageUrl,
                                          isMyStory: true))
                DispatchQueue.main.async {
                    self.reloadTableView()
                }
            }
        }
    }
    
    private func setupNavigation() {
        let addImage = UIImage(named: "add")
        let addButton = UIBarButtonItem(
            image: addImage,
            style: .plain,
            target: self,
            action: #selector(addPressedAddButton))
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    @objc func addPressedAddButton() {
        showOptionsAlert(needToAddPost: true)
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
        DispatchQueue.main.async {
            self.dataSource?.configure(with: self.posts,
                                       collectionList: self.stories)
            
            self.tableView.delegate = self.dataSource
            self.tableView.dataSource = self.dataSource
            
            self.tableView.reloadData()
        }
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
        if story.isMyStory {
            showOptionsAlert(needToAddPost: false)
        }
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
