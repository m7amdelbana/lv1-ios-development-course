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
    
    var stories: [Story] {
        return [
            .init(imageUrl: nil, isMyStory: true),
            .init(imageUrl: nil, username: "jake.marco"),
            .init(imageUrl: nil, username: "max.d1")
        ]
    }
    
    var posts: [Post] {
        return [
            .init(username: "jake.marco"),
            .init(username: "max.d1")
        ]
    }
    
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
        dataSource?.configure(with: posts,
                              collectionList: stories)
        
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        
        tableView.reloadData()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: false)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.presentImageReviwer(image: image)
        }
    }
    
    private func presentImageReviwer(image: UIImage) {
        let vc = ImageReviewerViewController(image: image) { confirmedImage in
            print("confirmedImage")
        }
        vc.modalPresentationStyle = .fullScreen
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIApplication.topViewController()?.present(vc, animated: true)
        }
    }
}

extension HomeViewController: HorizontalCellDelegate {
    
    func didSelectStory(_ story: Story) {
        
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
