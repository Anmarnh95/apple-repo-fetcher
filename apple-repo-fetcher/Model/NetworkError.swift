import Foundation

/// An error describing API failures.
enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError
    case noData
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL Error"
        case .invalidResponse:
            return "Invalid Response Error"
        case .decodingError:
            return "Decoding Error: Unable to decode backend response"
        case .noData:
            return "Data Error: No data received from backend"
            
        }
    }
}
