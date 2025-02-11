//
//  Tabbar.swift
//  combineTrain
//
//  Created by Apple on 11/02/2025.
//

import Foundation
import UIKit
class MainTabBarController: UITabBarController {
    var coordinator : TabbsrCordinator!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        customizeTabBarAppearance()
    }
    
    private func setupViewControllers() {
        let homeVC = HomeViewController()
        let testVC = TestViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        testVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 1)
        let homeNav = UINavigationController(rootViewController: homeVC)
        let settingsNav = UINavigationController(rootViewController: testVC)
        self.viewControllers = [homeNav, settingsNav]
    }
    
    private func customizeTabBarAppearance() {
        // Customize the tab bar appearance
        tabBar.tintColor = .systemBlue
        tabBar.barTintColor = .white
        tabBar.unselectedItemTintColor = .gray
    }
}
