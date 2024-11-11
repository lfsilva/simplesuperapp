import Foundation

struct ApiClientMock: APIClientProtocol {
    private let mockData: MockData
    
    init(mockData: MockData) {
        self.mockData = mockData
    }
    
    func send<T: RequestProtocol>(_ request: T) async throws -> T.Response where T.Response: Decodable {
        guard let mockData: T.Response = MockFileLoader.loadMockData(mockData: mockData, type: T.Response.self) else {
            throw NSError(domain: "ApiClientMock", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to load mock data"])
        }
        return mockData
    }
    
    func send<T: RequestProtocol>(_ request: T) async throws where T.Response == Void {
    }
}
