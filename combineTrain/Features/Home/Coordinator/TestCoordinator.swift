//
//  TestCoordinator.swift
//  combineTrain
//
//  Created by Apple on 31/01/2025.
//

//
//  HomeCoordinator.swift
//  combineTrain
//
//  Created by Apple on 31/01/2025.
//

import Foundation
import UIKit

class TestCoordinator : Coordinator {
    
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("got here")
        let splashViewController = TestViewController()
        splashViewController.coordinator = self
        
        navigationController.pushViewController(splashViewController, animated: true)
    }
    
    
    

//    
    
    
}
