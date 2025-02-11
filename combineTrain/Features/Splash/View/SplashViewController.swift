//
//  ViewController.swift
//  combineTrain
//
//  Created by Apple on 31/01/2025.
//

import UIKit
import Combine

class SplashViewController: UIViewController {
    
    var coordinator: SplashCoordinator?
    private var viewModel: SplashViewModel!
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        viewModel.startSplash()
    }
    
    func setupBindings() {
        viewModel.$isSplashFinished
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isFinished in
                if isFinished {
                    self?.coordinator?.showHome()
                }
            }
            .store(in: &cancellables)
    }
    
    
}

