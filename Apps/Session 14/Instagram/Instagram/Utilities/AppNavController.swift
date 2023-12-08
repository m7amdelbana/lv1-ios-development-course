//
//  AppNavController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 04/12/2023.
//

import UIKit

class AppNavController: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        // Setup UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Setup UI
        setupUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Setup UI
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupUI() {
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
    }
}
