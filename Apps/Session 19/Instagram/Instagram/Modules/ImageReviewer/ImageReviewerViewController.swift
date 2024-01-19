//
//  ImageReviewerViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 19/01/2024.
//

import UIKit

class ImageReviewerViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    private let image: UIImage
    private let didConfirm: (UIImage) -> ()
    
    init(image: UIImage, didConfirm: @escaping (UIImage) -> ()) {
        self.image = image
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
    }
    
    @IBAction func actionConfirm(_ sender: Any) {
        didConfirm(image)
        dismiss(animated: true)
    }
    
    @IBAction func actionClose(_ sender: Any) {
        dismiss(animated: true)
    }
}
