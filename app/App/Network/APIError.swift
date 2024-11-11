import Foundation

enum APIError: Error, LocalizedError {
    case badURL
    case badServerResponse
    case errorStatusCode(Int)
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Malformed URL."
        case .badServerResponse:
            return "Received bad data from the server."
        case .errorStatusCode(let statusCode):
            return "Response error status code: \(statusCode)."
        }
    }
}
