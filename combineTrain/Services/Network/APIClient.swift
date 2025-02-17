import Foundation
import Combine

class APIClient {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(
        _ endpoint: Endpoint,
        queryParameters: [String: String]? = nil,
        body: [String: Any]? = nil
    ) -> AnyPublisher<T, Error> {
        guard var urlComponents = URLComponents(string: endpoint.baseURL + endpoint.path) else {
            return Fail(error: APIError.invalidRequest).eraseToAnyPublisher()
        }
        
        if let queryParameters = queryParameters {
            urlComponents.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let finalURL = urlComponents.url else {
            return Fail(error: APIError.invalidRequest).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = endpoint.method
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        if let body = body {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                
                guard (200..<300).contains(httpResponse.statusCode) else {
                    throw APIError.httpError(statusCode: httpResponse.statusCode)
                }
                
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let apiError = error as? APIError {
                    return apiError
                } else {
                    return APIError.decodingError(error)
                }
            }
            .eraseToAnyPublisher()
    }
}
