//
//  EndPoint.swift
//  combineTrain
//
//  Created by Apple on 15/02/2025.
//

import Foundation

// MARK: - Endpoint

enum Endpoint {
    case items
    case itemDetails(id: Int)
    
    var baseURL: String {
        return "https://api.example.com"
    }
    
    var path: String {
        switch self {
        case .items:
            return "/items"
        case .itemDetails(let id):
            return "/items/\(id)"
        }
    }
    
    var method: String {
        switch self {
        case .items, .itemDetails:
            return "GET"
        }
    }
    
    var urlRequest: URLRequest? {
        guard let url = URL(string: baseURL + path) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}


// MARK: - APIError
enum APIError: Error {
    case invalidRequest
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError(Error)
    case unknown(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidRequest:
            return "Invalid request"
        case .invalidResponse:
            return "Invalid response"
        case .httpError(let statusCode):
            return "HTTP error with status code: \(statusCode)"
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}
