//
//  SplashViewModel.swift
//  combineTrain
//
//  Created by Apple on 05/02/2025.
//

import Foundation
import Combine

class SplashViewModel {
    
    @Published var isSplashFinished = false
    
    func startSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.isSplashFinished = true
        })
    }
    
}
