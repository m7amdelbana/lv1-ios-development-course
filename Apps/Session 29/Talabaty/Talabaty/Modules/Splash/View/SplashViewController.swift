//
//  SplashViewController.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 19/02/2024.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let viewModel = SplashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
    }
}

