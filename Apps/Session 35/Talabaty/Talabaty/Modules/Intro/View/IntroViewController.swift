//
//  IntroViewController.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 15/05/2024.
//

import UIKit

class IntroViewController: UIViewController {

    init() {
        super.init(nibName: .init(describing: Self.self),
                   bundle: .init(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
