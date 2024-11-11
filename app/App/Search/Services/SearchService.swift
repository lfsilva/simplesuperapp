import SwiftUI

protocol SearchServiceProtocol {
    func fatchMoview(title: String) async throws -> [MovieResponse]
}

final class SearchService: SearchServiceProtocol {
    
    let client: APIClientProtocol
    
    init(client: APIClientProtocol) {
        self.client = client
    }

    func fatchMoview(title: String) async throws -> [MovieResponse] {
        let request = SearchRequest(title: title)
        return try await client.send(request)
    }

}
