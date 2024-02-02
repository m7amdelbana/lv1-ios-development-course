//
//  AppTabBarController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 04/12/2023.
//

import UIKit

class AppTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure UI
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Home
        let itemHome = AppNavController(
            rootViewController: HomeViewController())
        
        let tabHome = UITabBarItem(
            title: "Home",
            image: UIImage(named: "tab-home"),
            selectedImage: UIImage(named: "tab-home-selected"))
        
        itemHome.tabBarItem = tabHome
        
        // Profile
        let itemProfile = AppNavController(
            rootViewController: ProfileViewController())
        
        let tabProfile = UITabBarItem(
            title: "Profile",
            image: UIImage(named: "tab-profile"),
            selectedImage: UIImage(named: "tab-profile-selected"))
        
        itemProfile.tabBarItem = tabProfile
        
        viewControllers = [itemHome, itemProfile]
    }
}
