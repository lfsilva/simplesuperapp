import Foundation

protocol APIClientProtocol {
    func send<T: RequestProtocol>(_ request: T) async throws -> T.Response where T.Response: Decodable
    func send<T: RequestProtocol>(_ request: T) async throws where T.Response == Void
}


struct APIClient: APIClientProtocol {
    private let baseURL: URL
    private let session: URLSession
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    
    init(
        baseURL: URL,
        session: URLSession,
        encoder: JSONEncoder = JSONEncoder(),
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.baseURL = baseURL
        self.session = session
        self.encoder = encoder
        self.decoder = decoder
    }

}

extension APIClient {
    func send<T: RequestProtocol>(_ request: T) async throws -> T.Response where T.Response: Decodable {
        try await send(request, decode)
    }

    func send<T: RequestProtocol>(_ request: T) async throws where T.Response == Void {
        try await send(request) { _ in () }
    }
    
    private func send<T: RequestProtocol>(
        _ request: T,
        _ decode: @escaping (Data) async throws -> T.Response) async throws -> T.Response
    {
        let urlRequest = try await makeURLRequest(for: request)
        let (data, response) = try await session.data(for: urlRequest, delegate: nil)
        try validate(response: response, data: data)
        return try await decode(data)
    }
    
    func makeURLRequest<T: RequestProtocol>(for request: T) async throws -> URLRequest {
        let url = try makeURL(for: request)
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpMethod = request.method.rawValue
        if let body = request.body {
            urlRequest.httpBody = try await encode(body)
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
        if urlRequest.value(forHTTPHeaderField: "Accept") == nil {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        }
        return urlRequest
    }
    
    private func makeURL<T: RequestProtocol>(for request: T) throws -> URL {
        guard let url = request.url else {
            throw APIError.badURL
        }
        let absoluteURL = url.scheme == nil ? baseURL.appendingPathComponent(url.absoluteString) : url
        guard var components = URLComponents(url: absoluteURL, resolvingAgainstBaseURL: false) else {
            throw APIError.badURL
        }
        if let query = request.query, !query.isEmpty {
            components.queryItems = query.map(URLQueryItem.init)
        }
        guard let url = components.url else {
            throw APIError.badURL
        }
        return url
    }
    
    private func encode(_ value: some Encodable) async throws -> Data? {
        if let data = value as? Data {
            return data
        } else if let string = value as? String {
            return string.data(using: .utf8)
        } else {
            return try await Task.detached {
                try self.encoder.encode(value)
            }.value
        }
    }
    
    private func decode<T: Decodable>(_ data: Data) async throws -> T {
        if T.self == Data.self {
            return data as! T
        } else if T.self == String.self {
            guard let string = String(data: data, encoding: .utf8) else {
                throw APIError.badServerResponse
            }
            return string as! T
        } else {
            return try await Task.detached {
                try self.decoder.decode(T.self, from: data)
            }.value
        }
    }
    
    private func validate(response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse else { return }
        if !(200..<300).contains(httpResponse.statusCode) {
            throw APIError.errorStatusCode(httpResponse.statusCode)
        }
    }
}
