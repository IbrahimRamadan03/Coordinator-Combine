//
//  HomeRepositary.swift
//  combineTrain
//
//  Created by Apple on 15/02/2025.
//

import Foundation
import Combine

class HomeRepositary {
    
    private let apiClient : APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchItems()-> AnyPublisher <[Item] , Error> {
        return apiClient.request(Endpoint.items)
    }
    

    
}
