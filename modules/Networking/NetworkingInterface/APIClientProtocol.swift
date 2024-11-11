public protocol APIClientProtocol {
    func send<T: RequestProtocol>(_ request: T) async throws -> T.Response where T.Response: Decodable
    func send<T: RequestProtocol>(_ request: T) async throws where T.Response == Void
}
