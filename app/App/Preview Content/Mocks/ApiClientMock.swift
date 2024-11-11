import Foundation

struct ApiClientMock: APIClientProtocol {
    private let mockData: MockData
    private let mockDelay: UInt64
    
    init(mockData: MockData, mockDelay: UInt64 = 0) {
        self.mockData = mockData
        self.mockDelay = mockDelay
    }
    
    func send<T: RequestProtocol>(_ request: T) async throws -> T.Response where T.Response: Decodable {
        try await Task.sleep(nanoseconds: mockDelay)
        
        guard let mockData: T.Response = MockFileLoader.loadMockData(mockData: mockData, type: T.Response.self) else {
            throw NSError(domain: "ApiClientMock", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to load mock data"])
        }
        return mockData
    }
    
    func send<T: RequestProtocol>(_ request: T) async throws where T.Response == Void {
    }
}
