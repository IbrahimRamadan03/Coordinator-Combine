//
//  SplashCoordinator.swift
//  combineTrain
//
//  Created by Apple on 31/01/2025.
//

import Foundation
import UIKit

class SplashCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let splashViewModel = SplashViewModel()
        let splashViewController = SplashViewController(viewModel: splashViewModel)
        splashViewController.coordinator = self
        navigationController.pushViewController(splashViewController, animated: true)
    }
    
     func showHome() {
         let homeCoordinator = TabbsrCordinator(navigationController: navigationController)
         addChildCoordinator(homeCoordinator)
         homeCoordinator.start()
     }
    
    
}
