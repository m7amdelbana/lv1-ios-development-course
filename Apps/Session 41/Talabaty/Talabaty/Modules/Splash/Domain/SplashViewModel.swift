//
//  SplashViewModel.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 22/03/2024.
//

import Foundation
import TalabatyCore

class SplashViewModel {
    
    init() {
        
    }
    
    func viewDidLoad() {
        CartHandler.shared.getCarts { _ in }
    }
}
