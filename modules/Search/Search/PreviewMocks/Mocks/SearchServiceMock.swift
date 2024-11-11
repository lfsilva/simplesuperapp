#if DEBUG
import Foundation

struct SearchServiceMock: SearchServiceProtocol {
    private let mockDelay: UInt64
    
    init(mockDelay: UInt64 = 0) {
        self.mockDelay = mockDelay
    }
    
    func fatchMoview(title: String) async throws -> [MovieResponse] {
        try await Task.sleep(nanoseconds: mockDelay)
        let client = ApiClientMock(mockData: .searchByTitle)
        let request = SearchRequest(title: title)
        return try await client.send(request)
    }
}
#endif
