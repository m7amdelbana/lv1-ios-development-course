//
//  LoadingManager.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 07/05/2024.
//

import UIKit
import NVActivityIndicatorView

class LoadingManager {
    
    private let activityIndicatorView: NVActivityIndicatorView
    
    init(frame: CGRect) {
        activityIndicatorView = .init(frame: frame,
                                      type: .ballPulseSync,
                                      color: .init(named: "primary-dark"),
                                      padding: nil)
    }
    
    func showLoading() {
        activityIndicatorView.startAnimating()
    }
    
    func hideLoading() {
        activityIndicatorView.stopAnimating()
    }
}
