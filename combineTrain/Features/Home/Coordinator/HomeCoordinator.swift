//
//  HomeCoordinator.swift
//  combineTrain
//
//  Created by Apple on 31/01/2025.
//

import Foundation
import UIKit

class HomeCoordinator : Coordinator {
    
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        homeViewController.coordinator = self
        let homeNavController = UINavigationController(rootViewController: homeViewController)
        homeNavController.modalPresentationStyle = .fullScreen
        navigationController.present(homeNavController, animated: true, completion: nil)
    }
    
    
    func showTestScrren() {
        if let homeNavController = navigationController.presentedViewController as? UINavigationController {
            let detailsCoordinator = TestCoordinator(navigationController: homeNavController)
            addChildCoordinator(detailsCoordinator)
            detailsCoordinator.start()
        }
    }
    
}
