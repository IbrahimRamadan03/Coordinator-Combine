//
//  HomeViewModel.swift
//  combineTrain
//
//  Created by Apple on 15/02/2025.
//

import Foundation
import Combine

class HomeViewModel {
    
    @Published var items : [Item] = []
    @Published var error: Error?
    @Published var isLoading : Bool = false
    private let repositary : HomeRepositary
    private var cancellables = Set<AnyCancellable>()

    
    init(repositary: HomeRepositary) {
        self.repositary = repositary
    }
    
    func fetchData() {
        repositary.fetchItems()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error
                }
            } receiveValue: { [weak self] items in
                self?.items = items
            }
            .store(in: &cancellables)
    }
    
}
