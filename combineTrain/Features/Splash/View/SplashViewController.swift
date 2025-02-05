//
//  ViewController.swift
//  combineTrain
//
//  Created by Apple on 31/01/2025.
//

import UIKit

class SplashViewController: UIViewController {
    
    var coordinator: SplashCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [weak self] in
            self?.coordinator?.showHome()
        }
    }
    
    
}

