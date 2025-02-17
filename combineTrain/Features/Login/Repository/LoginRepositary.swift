//
//  LoginRepositary.swift
//  combineTrain
//
//  Created by Apple on 17/02/2025.

import Foundation
import Combine

class LoginRepositary {
    
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func performLogin(requestModel: LoginRequestModel) -> AnyPublisher<LoginModel, Error> {
        guard let body = DataMapper.toDictionary(requestModel) else {
            return Fail(error: APIError.invalidRequest).eraseToAnyPublisher()
        }
        
        return apiClient.request(Endpoint.login, body: body)
    }
}
