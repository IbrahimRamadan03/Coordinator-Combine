//
//  TabbsrCordinator.swift
//  combineTrain
//
//  Created by Apple on 11/02/2025.
//

import Foundation
//
import UIKit

class TabbsrCordinator : Coordinator {
    
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = MainTabBarController()
        homeViewController.coordinator = self
        let homeNavController = UINavigationController(rootViewController: homeViewController)
        homeNavController.modalPresentationStyle = .fullScreen
        navigationController.present(homeNavController, animated: true, completion: nil)
    }
    
    
 
    
}
