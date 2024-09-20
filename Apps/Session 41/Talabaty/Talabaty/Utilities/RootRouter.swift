//
//  RootRouter.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 29/03/2024.
//

import UIKit

class RootRouter {
    
    static func presentRootScreen(with root: UIViewController) {
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        window?.makeKeyAndVisible()
        window?.rootViewController = root
    }
}
