//
//  APIClient.swift
//  combineTrain
//
//  Created by Apple on 15/02/2025.

import Foundation
import Combine

class APIClient {
    
    private let session : URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func request<T:Decodable>(_ endpoint : Endpoint)-> AnyPublisher <T, Error> {
        guard let urlRequest = endpoint.urlRequest else {
            return Fail(error: APIError.invalidRequest).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: urlRequest).tryMap { data , response in
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                throw APIError.httpError(statusCode: httpResponse.statusCode)
            }
            
            return data
        }.decode(type: T.self, decoder: JSONDecoder()).mapError { error in
            if let apiError = error as? APIError {
                return apiError
            } else {
                return APIError.decodingError(error)
            }
        }.eraseToAnyPublisher()
    }
}
