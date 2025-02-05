//
//  AppCoordinator.swift
//  combineTrain
//
//  Created by Apple on 31/01/2025.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

extension Coordinator {
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}

class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showSplash()
    }
    
    private func showSplash() {
        let spalshCoordinator = SplashCoordinator(navigationController: navigationController)
        addChildCoordinator(spalshCoordinator)
        spalshCoordinator.start()
    }
}
