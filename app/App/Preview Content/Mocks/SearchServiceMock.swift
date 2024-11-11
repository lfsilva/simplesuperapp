import Foundation

struct SearchServiceMock: SearchServiceProtocol {
    private let mockResponse: [MovieResponse]
    private let mockDelay: UInt64
    
    init(mockResponse: [MovieResponse], mockDelay: UInt64 = 0) {
        self.mockResponse = mockResponse
        self.mockDelay = mockDelay
    }
    
    func fatchMoview(title: String) async throws -> [MovieResponse] {
        try await Task.sleep(nanoseconds: mockDelay)
        return mockResponse
    }
}
