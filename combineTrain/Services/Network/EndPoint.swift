enum Endpoint {
    
    case items
    case itemDetails(id: Int)
    case login
    
    var baseURL: String {
        return "https://api.example.com"
    }
    
    var path: String {
        switch self {
        case .items:
            return "/items"
        case .itemDetails(let id):
            return "/items/\(id)"
        case .login :
        return "login"
        }
    }
    
    var method: String {
        switch self {
        case .items, .itemDetails:
            return "GET"
        case .login :
        return "POST"
        }
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
